using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MDM.Models
{
    public class CriterioResultado
    {
        public string Criterio { get; set; }
        public decimal? ValorCriterio { get; set; }
    }
    public class DimensionResultado
    {
        public string Dimension { get; set; }
        public decimal? ValorDimension { get; set; }
        public int NumeroCriterios { get; set; }
        public List<CriterioResultado> ListaCriterio { get; set; }
        public int Contador { get; set; }
    }
    
    public class LisDimensionResultado
    {
        public List<DimensionResultado> ListaDimensionResultado { get; set; }
    }

    public class Grap
    {
        public string title { get; set; }
        public string valueAxis { get; set; }
        public string balloonText { get; set; }
        public string bullet { get; set; }
        public int lineThickness { get; set; }
        public string valueField { get; set; }
    }

    public class ResultadosHistoricos
    {

    }
}