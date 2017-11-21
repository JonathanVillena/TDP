using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MDM.Models;
namespace MDM.ViewModel
{
    public class CuestionarioViewModel
    {
        public List<Dimension> LstDimension { get; set; }
        public List<Pregunta> LstPregunta { get; set; }
        public CuestionarioViewModel()
        {
            Fill();
        }
        public void Fill()
        {
            MDMEntities context = new MDMEntities();
            LstDimension = context.Dimension.ToList();
            LstPregunta = context.Pregunta.OrderBy(x => x.Criterio.Dimension.IdDimension).ToList();
        }
    }
}