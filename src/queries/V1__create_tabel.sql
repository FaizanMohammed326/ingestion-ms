CREATE SCHEMA IF NOT EXISTS spec;

CREATE TABLE IF NOT EXISTS spec.event (
  pid        INT       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  event_name VARCHAR UNIQUE,
  event_data JSON
);

CREATE TABLE IF NOT EXISTS spec.dataset (
  pid          INT       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  dataset_name VARCHAR UNIQUE,
  dataset_data JSON
);

CREATE TABLE IF NOT EXISTS spec.dimension (
  pid            INT       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  dimension_name VARCHAR UNIQUE,
  dimension_data JSON
);

CREATE SCHEMA IF NOT EXISTS ingestion;

CREATE TABLE IF NOT EXISTS ingestion.student_count_by_school_and_grade (
  pid           INT       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  school_id     VARCHAR,
  grade         INTEGER,
  student_count INTEGER
);

INSERT INTO spec.event (
  event_name, event_data)
VALUES ('student_count', '{
  "ingestion_type": "event",
  "input": {
    "type": "object",
    "properties": {
      "event_name": {
        "type": "string"
      },
      "event": {
        "type": "object",
        "properties": {
          "school_id": {
            "type": "string"
          },
          "grade": {
            "type": "string"
          },
          "count": {
            "type": "string"
          }
        },
        "required": [
          "school_id",
          "grade",
          "count"
        ]
      }
    },
    "required": [
      "event_name",
      "event"
    ]
  }
}');

INSERT INTO spec.dataset (dataset_name, dataset_data)
VALUES ('student_count_by_school_and_grade', '{
  "ingestion_type": "dataset",
  "input": {
    "type": "object",
    "properties": {
      "dataset_name": {
        "type": "string"
      },
      "dataset": {
        "type": "object",
        "properties": {
          "event_name": {
            "type": "string"
          },
          "dimension_name": {
            "type": "string"
          }
        },
        "required": [
          "school_id",
          "grade",
          "count"
        ]
      }
    },
    "required": [
      "dataset_name",
      "dataset"
    ]
  }
}');