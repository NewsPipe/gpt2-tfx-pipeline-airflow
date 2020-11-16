import fire
from datetime import datetime

from tfx_gpt2.components.export_for_tfserving import export_for_serving

text_token_size = 50000  # https://github.com/rkfg/gpt-2/issues/4

train_config = {'num_iterations': 20000000,  # number of iterations
                'batch_size': 1,  # Batch size
                'learning_rate': 0.00002,  # Learning rate for Adam
                'accumulate_gradients': 1,  # Accumulate gradients across N minibatches.
                'memory_saving_gradients': True,  # Use gradient checkpointing to reduce vram usage.
                'only_train_transformer_layers': False,  # Restrict training to the transformer blocks.
                'optimizer': 'adam',  # Optimizer. <adam|sgd>.
                'noise': 0.0,  # Add noise to input training data to regularize against typos.

                'top_k': 40,  # K for top-k sampling.
                'top_p': 0.0,  # P for top-p sampling. Overrides top_k if set > 0.

                'sample_every': 200000,  # Generate samples every N steps
                'sample_length': 1023,  # Sample this many tokens
                'sample_num': 5,  # Generate this many samples
                'save_every': 200000,  # Write a checkpoint every N steps
                }


def main(checkpoint_dir, output_dir):
    export_for_serving(checkpoint_dir, checkpoint_dir, output_dir)


if __name__ == '__main__':
    fire.Fire(hello)
