version 1.0

task xVCFMerge {
    input {
        Array[String] input_files
        String output_file
        String billing_project
        String workspace
        Int? cpu = 8
        Int? memory = 64
        Int? preemptible = 0
    }
    runtime {
        docker: "xbrianh/xsamtools:v0.5.2"
        memory: "${memory}G"
        cpu: "${cpu}"
        preemptible: "${preemptible}"
    }
    command {
        export GOOGLE_PROJECT=${billing_project}
        export WORKSPACE_NAME=${workspace}
        xsamtools vcf merge --inputs ${sep="," input_files} --output ${output_file}
    }
}

workflow xVCFMergeWorkflow {
    input {
        Array[String] input_files
        String output_file
        String billing_project
        String workspace
        Int? cpu = 8
        Int? memory = 64
        Int? preemptible = 0
    }
    call xVCFMerge { input: input_files=input_files,
                            output_file=output_file,
                            billing_project=billing_project,
                            workspace=workspace,
                            cpu=cpu,
                            memory=memory,
                            preemptible=preemptible }
}
