using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MDM.Models;

namespace MDM.Service
{
    public class CuestionarioService
    {
        public MDMEntities context;
        public CuestionarioService()
        {
            context = new MDMEntities();
        }
        public void AgregarRespuesta(int idPregunta, int idOpcion, int idUsuario, int numVez)
        {
           
            Respuesta objRespuesta = context.Respuesta.Where(x => x.Opcion.IdPregunta == idPregunta && x.IdUsuario == idUsuario && x.ContVez == numVez).FirstOrDefault();
             if (objRespuesta == null)
             {
                objRespuesta = new Respuesta();
                objRespuesta.IdUsuario = idUsuario;
                context.Respuesta.Add(objRespuesta);
           }
            objRespuesta.IdOpcion = idOpcion;
            objRespuesta.ContVez = numVez;
            context.SaveChanges();
        }
        public string ObtenerPorcentajeCompletado(int idUsuario, int last)
        {
       //     var last = (from re in context.Respuesta
       //                 where re.IdUsuario == idUsuario
        //                select re.ContVez).Distinct().Max();

            int numeroPreguntas = context.Pregunta.Count();
            int numeroRespuestas = context.Respuesta.Where(x => x.IdUsuario == idUsuario && x.ContVez == last).Count();
            double porcentaje = (Convert.ToDouble(numeroRespuestas) / Convert.ToDouble(numeroPreguntas)) * 100;
            porcentaje = Math.Round(porcentaje, 0);
            return porcentaje.ToString();
        }
        public void ObtenerRespuestas(List<Pregunta> ListaPregunta, int idUsuario, int vez)
        {

            // var listCont = (from re in context.Respuesta
            //                 where re.IdUsuario == idUsuario
            //                 select re.ContVez).Distinct().Max();

            foreach (Pregunta objPregunta in ListaPregunta)
            {
                try
                {
                    int IdOpcion = (from re in context.Respuesta
                                    join op in context.Opcion on re.IdOpcion equals op.IdOpcion
                                    join pre in context.Pregunta on op.IdPregunta equals pre.IdPregunta
                                    where pre.IdPregunta == objPregunta.IdPregunta && re.IdUsuario == idUsuario && re.ContVez == vez
                                    select (op.IdOpcion)).FirstOrDefault();
                    objPregunta.Valor = IdOpcion;

                }
                catch (Exception)
                {
                    objPregunta.Valor = 0;
                }
            }
        }
        public void AsignarValorEsperado(List<ResultadoEvaluacion_Result> listaResultado)
        {
            foreach (ResultadoEvaluacion_Result obj in listaResultado)
            {
                obj.ValorEsperado = context.Dimension.Where(x => x.NombreDimension == obj.Dimension).FirstOrDefault().ValorEsperado;
            }
        }
        public Usuario BorrarRespuestas(int idUsuario)
        {
            var listaRespuesta = context.Respuesta.Where(x => x.IdUsuario == idUsuario ).ToList();
            context.Respuesta.RemoveRange(listaRespuesta);
            var objUsuario = context.Usuario.Where(x => x.IdUsuario == idUsuario).FirstOrDefault();
            objUsuario.EncuestaTerminada = false;
            context.SaveChanges();
            return objUsuario;
        }

        public bool SinRepuesta(int idUsuario)
        {
            var NmroRespuesta = context.Respuesta.Where(x => x.IdUsuario == idUsuario).Count();
            if (NmroRespuesta == 0)
                return true;
            else
                return false;
        }
        public Usuario FinalizarEncuesta(int idUsuario)
        {
            var objUsuario = context.Usuario.Where(x => x.IdUsuario == idUsuario).FirstOrDefault();
            objUsuario.EncuestaTerminada = true;
            objUsuario.NroEcuestasTerminadas = obtenerNumeroDeRespondidos(idUsuario)/40;
            context.SaveChanges();
            
            return objUsuario;
        }
        public List<ResultadoEvaluacion_Result> ListaResultado(int idUsuario, int cant)
        {
            var ListaResultado = context.ResultadoEvaluacion(idUsuario,cant).ToList();
            return ListaResultado;
        }
        public List<DimensionResultado> ListaDetallesResultado(int idUsuario,int  cant)
        {
            List<DimensionResultado> ListaDetallesResultado = new List<DimensionResultado>();
            var ListaResultado = context.ResultadoEvaluacion(idUsuario, cant);
            var ListaCriterio = context.ResultadoCriterio(idUsuario,cant);
            foreach (var obj in ListaResultado)
            {
                DimensionResultado objNewDimension = new DimensionResultado();
                objNewDimension.Dimension = obj.Dimension;
                objNewDimension.ValorDimension = obj.Valor;
                objNewDimension.ListaCriterio = (from cri in context.Criterio
                                                 join lc in ListaCriterio on cri.NombreCriterio equals lc.Criterio
                                                 join di in context.Dimension on cri.IdDimension equals di.IdDimension
                                                 where di.NombreDimension == obj.Dimension
                                                 select new CriterioResultado
                                                 {
                                                     Criterio = cri.NombreCriterio,
                                                     ValorCriterio = lc.Valor
                                                 }).ToList();
                objNewDimension.NumeroCriterios = objNewDimension.ListaCriterio.Count;
                objNewDimension.Contador = cant;
                ListaDetallesResultado.Add(objNewDimension);
            }
            //PromerdioGeneral();
            return ListaDetallesResultado;
        }
        public int obtenerNumeroDeRespondidos(int idUsuario)
        {
            var listCont = (from re in context.Respuesta
                            where re.IdUsuario == idUsuario
                            select re.ContVez).Count();

            return Convert.ToInt32(listCont);
        }

        public int obtenerVeZ(int idUsuario)
        {
            var listCont = (from re in context.Usuario
                            where re.IdUsuario == idUsuario
                            select re.NroEcuestasTerminadas).FirstOrDefault();

            return Convert.ToInt32(listCont);
        }       
        public List<ResultadosHistoricos_Result> ListHisotiroResultado(int idUsuario)
        {
            var ListaHistorico = context.ResultadosHistoricos(idUsuario).ToList();
                return ListaHistorico;
        }

        public Usuario BorrarUltimaEncuesta(int idUsuario)
        {
            var last = (from re in context.Respuesta
                            where re.IdUsuario == idUsuario
                            select re.ContVez).Distinct().Max();

            var listaRespuesta = context.Respuesta.Where(x => x.IdUsuario == idUsuario && x.ContVez == last).ToList();
            context.Respuesta.RemoveRange(listaRespuesta);
            var objUsuario = context.Usuario.Where(x => x.IdUsuario == idUsuario).FirstOrDefault();
            //objUsuario.EncuestaTerminada = false;
            context.SaveChanges();
            return objUsuario;

        }


        public void PromerdioGeneral()
        {
            var obtUsuarios = (from us in context.Usuario
                               where us.NroEcuestasTerminadas != null
                               select new {UsuarioId =  us.IdUsuario, NumeroEcuentas = us.NroEcuestasTerminadas}).ToList();


            var temp = 0;
            foreach (var obj in obtUsuarios)
            {
                for (int i = 0; i < obj.NumeroEcuentas; i++)
                {
             //      temp =   context.ResultadoEvaluacion(obj.UsuarioId, i). ; 
                }


            }
        }

        public List<LisDimensionResultado> ListaHistoriaResultados(int idUsuario)////////
        {
            int cant = obtenerVeZ(idUsuario);
            List<LisDimensionResultado> HistoriaResulta = new List<LisDimensionResultado>();
            
            for(int i=1; i<=cant;i++)
            {
                LisDimensionResultado objDimenionResultado = new LisDimensionResultado();
                objDimenionResultado.ListaDimensionResultado = ListaDetallesResultado(idUsuario, i);
                HistoriaResulta.Add(objDimenionResultado);

            }
            
            return HistoriaResulta;
        }


        public List<Grap> ListaGraficos(int idUsuario)
        {
            int cant = (obtenerNumeroDeRespondidos(idUsuario) / 40);
            List<Grap> ListaGraficos = new List<Grap>();
            for (int i = 0; i < cant; i++)
            {
                int j = i + 1;
                Grap gp = new Grap();
                gp.title = "Resultado Evaluacion Nro°" + j;
                gp.valueAxis = "v1";
                gp.balloonText = "[[value]]";
                gp.bullet = "round";
                gp.lineThickness = 2;
                gp.valueField = "Valor "+(i+1) ;
                ListaGraficos.Add(gp);
            }
            return ListaGraficos;
        }
    }
}