+++
title = "How to correctly apply Batch Normalization layer in TensorFlow（the pitfall of UPDATE_OPS)"
date = 2019-02-09T18:07:18-08:00
draft = false
tags = ["deep-learning", "TensorFlow", "Python"]
category = ["deep-learning", "TensorFlow", "Python"]
+++


# Batch Normalization layer in TensorFlow

In this post, I'm not going to explain the math behind what batch normalization does and why it could help if we apply batch-normalization in our deep networks.  

For a quick look of what batch normalization is, check this [post](https://towardsdatascience.com/batch-normalization-theory-and-how-to-use-it-with-tensorflow-1892ca0173ad).  

For a deeper understanding of batch normalization, you can look up in the paper "Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift" by [Ioeffe and Szegedy (2015)](https://arxiv.org/abs/1502.03167).


# How to apply batch-normalization in TensorFlow
Thanks to the tensor flow API, we could apply batch-normalization as easy as we implement any other layers(eg. relu, dropout, etc). We simply call [`tf.layers.batch_normalization`](https://www.tensorflow.org/api_docs/python/tf/layers/batch_normalization) to create a batch-normalization layer. And as it is clearly noted that: make sure that `training` parameter is correctly set. We could declare a boolean placeholder to make sure that during training `training` is set to `True`, and when evaluating `training` is set to `False`. Because when inference(validation), we do not calculate the statistics(moving mean and moving variance) from validation data, instead we applied those calculated in the current training batch. 


# The pitfall: UPDATE_OPS
You might be confused that, after applying the batch-normalization layer, your network performs properly in training, maybe even achieve higher training accuracy, but the validation accuracy drops significantly for no reason.  

This is because in TensorFlow, the moving mean and moving variance need to be updated manually. It is clearly stated in a blue box in the documentation here[`tf.layers.batch_normalization`](https://www.tensorflow.org/api_docs/python/tf/layers/batch_normalization). But it is common for beginners to overlook those because the ease and homogeneity of applying other layers in TensorFlow. 

So when define `train_op` if you used batch-normalization, you need to create the dependency of `UPDATE_OPS` on your `train_op` like following:  

```python
  x_norm = tf.layers.batch_normalization(x, training=training)
  
  # ...

  update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)
  with tf.control_dependencies(update_ops):
    train_op = optimizer.minimize(loss)
```
