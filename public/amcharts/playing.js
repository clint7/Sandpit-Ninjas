
var chart = AmCharts.makeChart("piediv",{
  "type"    : "pie",
  "titleField"  : "category",
  "valueField"  : "column-1",
  "colors" : ["#000000", "#57032A", "#CA9726", "#990000", "#4B0C25"],
  "dataProvider"  : [
    {
      "category": "category 1",
      "column-1": 8
    },
    {
      "category": "category 2",
      "column-1": 6
    },
    {
      "category": "category 3",
      "column-1": 2
    }
  ]
});

var chart = AmCharts.makeChart("chartdiv",{
  "type": "radar",
  "categoryField": "category",
  "graphs": [
    {
      "valueField": "value"
    }
  ],
  "valueAxes": [
    {
      "axisTitleOffset": 20,
      "minimum": 0,
      "axisAlpha": 0.15,
      "dashLength": 3
    }
  ],
  "dataProvider": [
    {
      "category": "Category 1",
      "value": 156.9
    },
    {
      "category": "Category 2",
      "value": 131.1
    },
    {
      "category": "Category 3",
      "value": 115.8
    },
    {
      "category": "Category 4",
      "value": 109.9
    },
    {
      "category": "Category 5",
      "value": 108.3
    },
    {
      "category": "Category 6",
      "value": 99
    }
  ]
});