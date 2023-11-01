#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { BLAST_MAKEBLASTDB } from '../../../../../modules/nf-core/blast/makeblastdb/main.nf'
include { NCBITOOLS_VECSCREEN } from '../../../../../modules/nf-core/ncbitools/vecscreen/main.nf'

workflow test_ncbitools_vecscreen {
    input = [ file(params.test_data['homo_sapiens']['pacbio']['primers'], checkIfExists: true) ]
    //input = [file("/home/ea/sanger_data/tol_assembly/20220823_iyMegWill1_mito/20220823_iyMegWill1_and_ref_mitos_for_aligning_01.fa", checkIfExists: true)]
    BLAST_MAKEBLASTDB ( input )
    //def blast_db_path = BLAST_MAKEBLASTDB.out.db + "/primers.fasta"
    NCBITOOLS_VECSCREEN (  [ [id:'test'], input ], BLAST_MAKEBLASTDB.out.db )

    //input = [
    //    [ id:'test', single_end:false ], // meta map
    //    file(params.test_data['sarscov2']['genome_fasta'], checkIfExists: true)
    //]
    
    //input = [
    //    [ id:'test', single_end:false ], // meta map
    //    file(params.test_data['sarscov2']['genome_fasta'], checkIfExists: true)
    //]

    //input = [
    //    [ id:'test', single_end:false ], // meta map
    //    file("/home/ea/sanger_data/tol_assembly/20221023_grit_vectascan/test.fa", checkIfExists: true)
    //]
    //database_fasta = file("/home/ea/sanger_data/tol_assembly/20221023_grit_vectascan/test.fa", checkIfExists: true)

    

    //database_fasta = [
    //    file(params.test_data['homo_sapiens']['pacbio']['primers'], checkIfExists: true)
    //]

    //database_fasta = [
    //    file("/home/ea/sanger_data/tol_assembly/20221023_grit_vectascan/test.fa", checkIfExists: true)
    //]

    //BLAST_MAKEBLASTDB ( database_fasta )
    //NCBITOOLS_VECSCREEN ( input , BLAST_MAKEBLASTDB.out.db)
    //NCBITOOLS_VECSCREEN ( input , BLAST_MAKEBLASTDB.out.db)
    //NCBITOOLS_VECSCREEN ( input , database_fasta)
}