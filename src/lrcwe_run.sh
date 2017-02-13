#!/bin/bash
ITER_NUM=3
VEC_NUM=200
BELTA_ANT=0.85
BELTA_SYN=0.7
BELTA_REL=0.7
ALPHA_SYN=0.05
ALPHA_ANT=0.01
ALPHA_REL=0.01
TRAIN_PATH="../gen_data/wikicorpus.1b"
TRIPLET_PATH="../gen_data/relation.data.out"
SYNONYM_PATH="../gen_data/synonyms.wd.ppdb.outjoin.filter"
ANTONYM_PATH="../gen_data/antonyms.wd.filter.f100.pair"

#MODEL_PATH="../gen_data/model/lswe-cbow-${VEC_NUM}-model.sa.${ITER_NUM}.${BELTA_SYN}.${ALPHA_SYN}.${BELTA_ANT}.${ALPHA_ANT}.bin"
#MODEL_PATH="../gen_data/model/lswe-cbow-${VEC_NUM}-model.a.${ITER_NUM}.${BELTA_ANT}.${ALPHA_ANT}.swe.bin"
#MODEL_PATH="../gen_data/model/lswe-cbow-${VEC_NUM}-model.s.${ITER_NUM}.${BELTA_SYN}.${ALPHA_SYN}.bin"
MODEL_PATH="../gen_data/model/lswe-cbow-${VEC_NUM}-model.r.${ITER_NUM}.${BELTA_REL}.${ALPHA_REL}.reldata.bin"

VOCAB_PATH="../gen_data/model/lswe.vocab.1b"

# triplet + synonym + antonym
#./lrcwe -train ${TRAIN_PATH} -triplet ${TRIPLET_PATH} -synonym ${SYNONYM_PATH} -antonym ${ANTONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# synonym + antonym
#./lrcwe -train ${TRAIN_PATH} -synonym ${SYNONYM_PATH} -antonym ${ANTONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -belta-syn ${BELTA_SYN} -alpha-syn ${ALPHA_SYN} -belta-ant ${BELTA_ANT} -alpha-ant ${ALPHA_ANT} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# synonym
#./lrcwe -train ${TRAIN_PATH} -synonym ${SYNONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -belta-syn ${BELTA_SYN} -alpha-syn ${ALPHA_SYN} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# antonym
#./lrcwe -train ${TRAIN_PATH} -antonym ${ANTONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -belta-ant ${BELTA_ANT} -alpha-ant ${ALPHA_ANT} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# triplet
./lrcwe -train ${TRAIN_PATH} -triplet ${TRIPLET_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -belta-rel ${BELTA_REL} -alpha-rel ${ALPHA_REL} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}
