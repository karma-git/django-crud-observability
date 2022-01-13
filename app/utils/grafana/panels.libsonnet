//const:
local plugin_version = '7.3.6';
// vars
local http_status_method_ep = {
  title: 'HTTP by status, method, endpoint',
  description: 'Provides data about target of the request, method and status code',
  legend: '{{status}} - {{method}} - {{view}}',
};
local crud_panel = {
  title: 'CRUD status',
  description: '<POST> reuqests to app models',
};
local rps_lat = {
  title: 'RPS || Latency',
  description: 'Requests per period of time and Latency',
};
local detail_lat = {
  title: 'Detail Latency',
  description: 'Latency statistics grouped by view controller and http method',
};
local db_status = {
  title: 'postgres stats',
  description: 'postgres stats: executes, connections, queries per second',
};

[
  {
    datasource: null,
    description: http_status_method_ep.description,
    fieldConfig: {
      defaults: {
        custom: {},
        mappings: [],
        thresholds: {
          mode: 'absolute',
          steps: [
            {
              color: 'green',
              value: null,
            },
            {
              color: 'red',
              value: 80,
            },
          ],
        },
      },
      overrides: [],
    },
    gridPos: {
      h: 8,
      w: 12,
      x: 0,
      y: 0,
    },
    id: 10,
    options: {
      displayMode: 'lcd',
      orientation: 'horizontal',
      reduceOptions: {
        calcs: [
          'mean',
        ],
        fields: '',
        values: false,
      },
      showUnfilled: true,
    },
    pluginVersion: '7.3.6',
    targets: [
      {
        expr: 'django_http_responses_total_by_status_view_method_total',
        interval: '',
        legendFormat: http_status_method_ep.legend,
        refId: 'A',
      },
    ],
    timeFrom: null,
    timeShift: null,
    title: http_status_method_ep.title,
    type: 'bargauge',
  },
  {
    datasource: null,
    description: crud_panel.description,
    fieldConfig: {
      defaults: {
        custom: {},
        mappings: [],
        thresholds: {
          mode: 'absolute',
          steps: [
            {
              color: 'blue',
              value: null,
            },
            {
              color: 'red',
              value: 50,
            },
          ],
        },
      },
      overrides: [],
    },
    gridPos: {
      h: 8,
      w: 12,
      x: 12,
      y: 0,
    },
    id: 12,
    options: {
      displayMode: 'lcd',
      orientation: 'horizontal',
      reduceOptions: {
        calcs: [
          'mean',
        ],
        fields: '',
        values: false,
      },
      showUnfilled: true,
    },
    pluginVersion: '7.3.6',
    targets: [
      {
        expr: 'django_model_inserts_total',
        interval: '',
        legendFormat: 'create - {{model}}',
        refId: 'A',
      },
      {
        expr: 'django_model_updates_total',
        interval: '',
        legendFormat: 'update - {{model}}',
        refId: 'B',
      },
      {
        expr: 'django_model_deletes_total',
        interval: '',
        legendFormat: 'delete - {{model}}',
        refId: 'C',
      },
    ],
    timeFrom: null,
    timeShift: null,
    title: crud_panel.title,
    type: 'bargauge',
  },
  {
    aliasColors: {},
    bars: true,
    dashLength: 10,
    dashes: false,
    datasource: null,
    description: rps_lat.description,
    fieldConfig: {
      defaults: {
        custom: {},
      },
      overrides: [],
    },
    fill: 1,
    fillGradient: 0,
    gridPos: {
      h: 8,
      w: 12,
      x: 0,
      y: 8,
    },
    hiddenSeries: false,
    id: 4,
    legend: {
      avg: false,
      current: false,
      max: false,
      min: false,
      show: true,
      total: false,
      values: false,
    },
    lines: false,
    linewidth: 1,
    nullPointMode: 'null',
    options: {
      alertThreshold: true,
    },
    percentage: false,
    pluginVersion: '7.3.6',
    pointradius: 2,
    points: false,
    renderer: 'flot',
    seriesOverrides: [],
    spaceLength: 10,
    stack: false,
    steppedLine: false,
    targets: [
      {
        expr: 'django_http_requests_body_total_bytes_sum',
        interval: '',
        legendFormat: 'rps',
        refId: 'A',
      },
      {
        expr: 'django_http_requests_latency_including_middlewares_seconds_sum',
        interval: '',
        legendFormat: 'avg latency',
        refId: 'B',
      },
    ],
    thresholds: [],
    timeFrom: null,
    timeRegions: [],
    timeShift: null,
    title: rps_lat.title,
    tooltip: {
      shared: true,
      sort: 0,
      value_type: 'individual',
    },
    type: 'graph',
    xaxis: {
      buckets: null,
      mode: 'time',
      name: null,
      show: true,
      values: [],
    },
    yaxes: [
      {
        format: 'short',
        label: null,
        logBase: 1,
        max: null,
        min: null,
        show: true,
      },
      {
        format: 'short',
        label: null,
        logBase: 1,
        max: null,
        min: null,
        show: true,
      },
    ],
    yaxis: {
      align: false,
      alignLevel: null,
    },
  },
  {
    datasource: null,
    description: detail_lat.description,
    fieldConfig: {
      defaults: {
        custom: {},
        mappings: [],
        thresholds: {
          mode: 'absolute',
          steps: [
            {
              color: 'green',
              value: null,
            },
            {
              color: 'red',
              value: 80,
            },
          ],
        },
      },
      overrides: [],
    },
    gridPos: {
      h: 8,
      w: 12,
      x: 12,
      y: 8,
    },
    id: 2,
    options: {
      reduceOptions: {
        calcs: [
          'mean',
        ],
        fields: '',
        values: false,
      },
      showThresholdLabels: false,
      showThresholdMarkers: true,
    },
    pluginVersion: '7.3.6',
    targets: [
      {
        expr: 'django_http_requests_latency_seconds_by_view_method_sum',
        interval: '',
        legendFormat: '{{view}} - {{method}}',
        queryType: 'randomWalk',
        refId: 'A',
      },
    ],
    timeFrom: null,
    timeShift: null,
    title: detail_lat.title,
    type: 'gauge',
  },
  {
    datasource: null,
    description: db_status.description,
    fieldConfig: {
      defaults: {
        custom: {},
        mappings: [],
        thresholds: {
          mode: 'absolute',
          steps: [
            {
              color: 'green',
              value: null,
            },
            {
              color: 'red',
              value: 80,
            },
          ],
        },
      },
      overrides: [],
    },
    gridPos: {
      h: 8,
      w: 12,
      x: 0,
      y: 16,
    },
    id: 14,
    options: {
      colorMode: 'value',
      graphMode: 'area',
      justifyMode: 'auto',
      orientation: 'auto',
      reduceOptions: {
        calcs: [
          'mean',
        ],
        fields: '',
        values: false,
      },
      textMode: 'auto',
    },
    pluginVersion: '7.3.6',
    targets: [
      {
        expr: 'django_db_execute_total',
        interval: '',
        legendFormat: 'executes',
        refId: 'A',
      },
      {
        expr: 'django_db_new_connections_total',
        interval: '',
        legendFormat: 'connections',
        refId: 'C',
      },
      {
        expr: 'django_db_query_duration_seconds_sum',
        interval: '',
        legendFormat: 'query avg duration',
        refId: 'B',
      },
    ],
    timeFrom: null,
    timeShift: null,
    title: db_status.title,
    type: 'stat',
  },
]
