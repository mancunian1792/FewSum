# To set up Inference

```
sh download_and_prepare_inference.sh
```
The above file will download the required tar files (model weights) and create few directories which the existing code depends on.


```
conda create -n fewsum python=3.7.5
```

```
conda activate fewsum
```

Install required modules.

```
pip install -r requirements.txt
```

Add the root directory to the path if you want to execute scripts from the command line.

```
export PYTHONPATH=root_path:$PYTHONPATH
```


Start the Fast API server

```
uvicorn fewsum.inference:app --reload
```
You can see the swagger url in the [localhost-swagger](http://127.0.0.1:8000/docs). 

To try out a sample request, use the following json

```
{
  "requests": [
    {
      "reviews": [
        "I got this airpods pro today and I cant with to use my new airpods, but when I open and check the box, this airpod is made in Vietnam, I have read some people write the airpods made in Vietnam have quality issues, and I open to check it, I found the glue overflow at bonding position, you can see the yellow line, it is glue, and it have cut feel when you touch the body of this airpods",
"These are really nice earphones. I ve had mine for about a year and have enjoyed them from the start. Once you find the right size of rubber inserts they stay in your ears better. The Noise Canceling feature is really nice especially when it comes to trying to listening to music or a phone call with loud background noise. I have also used these as hearing aids to listen to conversations ",
"I received them one day early but the packaging was damaged and the shipping box was fine witch means that they were damaged before they shipped. This is very disappointing but the ear buds themselves seem fine just hope that in the long run I dont run into any issues",
"Slight upgrade from original AirPod Pros because of the magsafe charging, everything else seem same as last gen but, still great headphones and love the noise cancellation feature!",
"These little things pack one hell of a punch!Apples new noise cancellation and transparency modes lay the groundwork for a new generation of wireless headphones. Yes others may have used similar technology before, but Apples simplistic UI made for the airpods pro make the experience so much better than what other companies offer.Coming from the first generation airpods, the experience ",
"Received these AirPods out the box, exactly as shown on pictures. Plastic Seal was completely compromised. Immediately knew something was up. CLEARLY FAKE AirPods they couldn’t even get the boxes to match correctly. Just go straight to Apple avoid this hassle.",
"I’m thrilled. I love the fact there’s multiple ear tips and the small ones fit my ears great. Thrilled with the noise canceling feature while I stare at a family member yapping loudly on the phone and I don’t have to crank my volume up to drown them out. The controls are easy. It pauses music when I take an earbud out, so I’m not fumbling to pause and then yanking an earbud out while yel",
"Received today. One bud had scratches and scuffs. Doesnt look new at all. Ive returned for an exchange and will update my review when I get a new NEW pair.Received today. One bud had scratches and scuffs. Doesnt look new at all. Ive returned for an exchange and will update my review when I get a new NEW pair.UPDATE: Amazon shipped a replacement next day. This pair appears better, but"
      ],
      "rating": [
        1,4,3,5,5,1,5,3
      ],
      "category": "electronics",
      "group_id": "B09JQMJHXY"
    },
{
      "reviews": [
        "have a pair of Jaybird headphones and it was nice to compare these headphones. These headphones have really good sound and pair with your phone super easy! The carrying case was a nice touch and the product was very well packaged. I havent used the other things that have come with the package, but I plan on using them.",
"OK, so initially I didnt like the way these sounded (I am a DJ and have $300 DJ headphones, so I had high expectations I suppose). Anyway, I took a shot on these for the gym - and initially they sounded like complete crap (super distorted at high volume, no bass, etc.) Then I switched to the RED memory foam tips (included in my box, but not listed in the description)",
"2nd unit i returned takebit back on the drawing board the recharge just doesnt work, and if you buy it for sure yours will fail ill bet on it, both mine failed after a month of normal use",
"Read so many reviews on both the Canadian and US Amazon site about how awesome the Senso headphones are before I purchased them. Needless to say was I pretty excited given the consistency of feedback on both sites. Sadly, within 10 secs of the first song i have to say the headphones sound quality is probably some of the worst ive ever experienced. Believe me im no audiophile, never o",
"The sound was great BUT I’ve owned 2 pairs and the first lasted 3 weeks and the second only one week. They won’t charge. I only wear them for workouts and they have died on me. I contacted the company and they responded saying how to reset them. That didn’t work. I contacted them to see where to send them to get repaired or replaced as they are under warranty and they haven’t got back to",
"This product looked exactly as pictured with good sound quality. Only problem is that my ears are too small and the hooks wont stay in place. Vendor was great and I received the item really quickly too.",
"Like most Bluetooth headphones these sometimes disconnect and a kind of bulky. For the price they are worth it though.",
"These headphones are the newer version then the previous ones. Love them.Worth the 25$ ! Get These headphones great great sound quality great build great everything only takes an hour and a half to charge up you get a full eight hour battery with them and you get a carrying case as well I love everything about these headphones are my new best friend on top of that that your loop shapes t"
      ],
      "rating": [
        4,5,1,2,1,4,4,5
      ],
      "category": "electronics",
      "group_id": "B0792QJQT1"
    }
  ]
}
```

## Caveats to the current usage
1. Review length shouldn't exceed 390 characters
2. CUDA is a must.
3. Each produt must have only 8 reviews. 
4. Each product must have a rating (for each review), a category (electronics, cloth etc) and a group id which can be extracted from the amazon url itself.


# Few-Shot Learning for Opinion Summarization

This repository contains the codebase along with accompanying artifacts of the [corresponding work](https://arxiv.org/pdf/2004.14884.pdf) published at EMNLP 2020, Dominican Republic.

<p align="center">
<img src="img/fewsum.png" width="600">
</p>
 
## Installation

The easiest way to proceed is to create a separate [conda environment](https://docs.conda.io/en/latest/).

```
conda create -n fewsum python=3.7.5
```

```
conda activate fewsum
```

Install required modules.

```
pip install -r requirements.txt
```

Add the root directory to the path if you want to execute scripts from the command line.

```
export PYTHONPATH=root_path:$PYTHONPATH
```

## Data


### Training data

Data pre-processing pipeline along with instructions is available from the [previous project](https://github.com/abrazinskas/Copycat-abstractive-opinion-summarizer/tree/master/preprocessing). 
Further, reviews needs to be enriched with ROUGE scores (coverage property) in the leave-one-out fashion using `fewsum/scripts/postprocess_data.py`. 
This is done to avoid online ROUGE computations that are time consuming.

We also provide the final pre-processed dataset versions, both for [Amazon](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/reviews.zip) and [Yelp](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/yelp/reviews.zip).
Unzip them to `artifacts/[yelp or amazon]/`. These datasets can be directly used to train the model.  


### Annotated summaries

For the purpose of fine-tuning and evaluation, we produced [Yelp](artifacts/yelp/gold_summs) and [Amazon](artifacts/amazon/gold_summs) annotated datasets.
More information found in the [corresponding readme file](artifacts/gold_summs.md).

## Running the model

In order to arrive to the final model, a number of steps need to be executed as described below. For each step, we provided checkpoints that can be used to generate
summaries and also used as starting points for downstream steps. 

In general, model hyper-parameters can modified by altering corresponding classes in `fewsum/config/model_hp`. 
In the same vein, one can modify the run configuration of each model in `fewsum/config/run/` classes.

The `fewsum/workflow.py` is the main file for training and inference that has logic for assembling data pipelines, tokenizers, and other relevant
components. Unless a custom setup is required, no modifications of this file is needed. 

## Preparation

We provide checkpoints for each step for Amazon, which can be downloaded by following links in each section below. 
Checkpoints need to be placed to `artifacts/amazon/checkpoints/`. 
If you use a different path, specify it in a run configuration file, e.g., `fewsum/config/model_hp/unsup_run.py`.

We also provide the word vocabulary, BPE vocabularies, and a true caser in `artifacts/amazon/misc`. These can be produced for custom datasets using scripts available in `fewsum/scripts`.

### Unsupervised pre-training

Here, we use the leave-one-out objective in order to pre-train the model on unannotated reviews using the command below; [checkpoint](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/unsupervised.tar).

```
python fewsum/workflow.py --regime=unsupervised
```

### Novelty reduction

At this stage, we reduce the novelty by penalizing output probability assignments to words that do not appear in the input reviews; [checkpoint](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/novelty_reduction.tar). 

```
python fewsum/workflow.py --regime=novelty_reduction
```

### Plug-in network initialization

Here, the plug-in network is added that is trained to predict property values for reviews (derived by the oracle) based on the leave-one-out setting; [checkpoint](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/plugin_init.tar).

```
python fewsum/workflow.py --regime=plugin_init
```

### Plug-in network tuning

In this phase, we utilize human-written abstractive summaries and tune the plug-in network to predict their property values that are derived by the oracle; [checkpoint](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/plugin_tuning.tar).

```
python fewsum/workflow.py --regime=plugin_tuning
``` 

### Joint-tuning 
This is the final phase, where we fine-tune both the plug-in network and the attention mechanism over the encoder states; [checkpoint](https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/joint_tuning.tar).

```
python fewsum/workflow.py --regime=joint_tuning
```


### Summary generation
In order to generate summaries at any stage, please replace the `REGIME` token in the command below.

```
python fewsum/workflow.py --regime=REGIME --inference
```

Already generated summaries by the final model are also [available](/artifacts/amazon/gen_summs/).

## Citation
```
@inproceedings{brazinskas2020few,
  title={Few-Shot Learning for Opinion Summarization},
  author={Bra{\v{z}}inskas, Arthur and Lapata, Mirella and Titov, Ivan},
 booktitle={Proceedings of the conference on empirical methods in natural language processing (EMNLP)},
  year={2020}
}
```

## License

MIT
