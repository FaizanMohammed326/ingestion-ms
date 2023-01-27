export interface Dimension {
    dimension_name: string,
    dimension: object[];
}

export interface IEvent {
    event_name: string,
    event: object[];
}

export interface Dataset {
    dataset_name: string,
    dataset: object
}

export interface Pipeline {
    pipeline_name: string
}

export interface CsvImport {
    pipeline_name: string
}

export interface Result {
    code: number,
    message?: string,
    error?: string
}
export class FileStatus {
    filename?: string
    ingestion_type?: string
    ingestion_name?: string
}
