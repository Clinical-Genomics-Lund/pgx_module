
rule VariantFiltration:
    params:
        DP = 100,
        read_ratio = 0.2
    input:
        vcf = "Results/Haplotypecaller/{sample}_{seqID}.vcf"
    output:
        filtered_vcf = "Results/Haplotypecaller/filtered/{sample}_{seqID}.vcf"
    singularity:
        config["singularities"]["get_target"]
    shell:
        """
        python3 src/Filtering/variant_filtration.py \
            --input_vcf={input.vcf} \
            --read_ratio={params.read_ratio} \
            --depth={params.DP} \
            --output_file={output.filtered_vcf} 
        """
