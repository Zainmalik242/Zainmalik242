# 🔐 Encrypted GAN Medical Image System

A complete Flask API for secure medical image processing using GANs and homomorphic encryption (TenSEAL).

## 🚀 Quick Start

### 1. Install Dependencies
```bash
pip install -r requirements.txt
```

### 2. Run the API Server
```bash
python gans.py
```

### 3. Test the API
```bash
curl http://localhost:5000/api/status
```

## 📋 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/status` | GET | Check system status |
| `/api/train` | POST | Start model training |
| `/api/get-dataset-samples` | GET | Get dataset samples |
| `/api/get-original-samples` | GET | Get enhanced samples |
| `/api/encrypt-images` | GET | Run encryption demo |
| `/api/generate-sample` | GET | Generate synthetic image |

## 🔧 Integration Examples

### Frontend (JavaScript)
```javascript
const API_BASE = 'http://localhost:5000/api';

// Check status
const status = await fetch(`${API_BASE}/status`).then(r => r.json());

// Start training
const train = await fetch(`${API_BASE}/train`, {method: 'POST'}).then(r => r.json());

// Get samples
const samples = await fetch(`${API_BASE}/get-dataset-samples`).then(r => r.json());

// Run encryption
const encryption = await fetch(`${API_BASE}/encrypt-images`).then(r => r.json());

// Generate sample
const generated = await fetch(`${API_BASE}/generate-sample`).then(r => r.json());
```

### Backend (Python)
```python
from gans import app, train_models, G, D, E

# Method 1: Use as blueprint
main_app.register_blueprint(app, url_prefix='/gan-api')

# Method 2: Direct function calls
train_models()
if G is not None:
    synthetic_image = G(z)
```

## 🏗️ System Architecture

### AI Models
- **FastGenerator**: Lightweight GAN generator (32x32 images)
- **FastDiscriminator**: Optimized discriminator network
- **FastEncoder**: Variational autoencoder for latent space
- **FastTenSEALEncryption**: Homomorphic encryption handler

### Features
- ✅ Fast training (1-2 minutes)
- ✅ Homomorphic encryption (CKKS/BFV)
- ✅ Medical image generation
- ✅ Quality metrics (MSE, PSNR)
- ✅ CORS enabled
- ✅ Background training
- ✅ Comprehensive error handling

## 📊 Configuration

| Parameter | Value | Description |
|-----------|-------|-------------|
| IMAGE_SIZE | 32 | Image dimensions |
| LATENT_DIM | 64 | Latent space dimension |
| BATCH_SIZE | 128 | Training batch size |
| EPOCHS | 3 | Training epochs |
| SUBSET_SIZE | 200 | Dataset size |

## 🔒 Security Features

- **Homomorphic Encryption**: TenSEAL CKKS/BFV schemes
- **Privacy-Preserving**: Data remains encrypted during computation
- **Secure Processing**: No plaintext exposure during inference

## 📈 Performance

- **Training Time**: 1-2 minutes
- **Inference Time**: <1 second per image
- **Memory Usage**: Optimized for GPU/CPU
- **Quality Metrics**: MSE and PSNR monitoring

## 🛠️ Usage Examples

### Run Integration Example
```bash
python simple_integration_example.py
```

### Use with Frontend HTML
Open the provided HTML file in a browser to see the complete interface.

### Production Deployment
```bash
# WSGI Server
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 gans:app

# Docker
docker build -t gan-medical .
docker run -p 5000:5000 gan-medical
```

## 📝 API Response Examples

### Status Check
```json
{
  "trained": true,
  "training_in_progress": false,
  "device": "cuda",
  "message": "Models are ready"
}
```

### Encryption Demo
```json
{
  "success": true,
  "data": {
    "samples": [
      {
        "id": 1,
        "original": "data:image/png;base64,...",
        "decrypted": "data:image/png;base64,...",
        "pattern_type": "normal",
        "mse": 0.023456,
        "psnr": 24.67
      }
    ],
    "metrics": {
      "total_samples": 3,
      "avg_mse": 0.025123,
      "avg_psnr": 23.45
    }
  }
}
```

## 🐛 Troubleshooting

### Common Issues
1. **CUDA Not Available**: Falls back to CPU automatically
2. **Training Timeout**: Default 2 minutes, increase if needed
3. **Memory Issues**: Reduce batch size or image size
4. **Encryption Failures**: Automatic fallback to BFV scheme

### Debug Mode
```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

## 📚 Documentation

- **API Documentation**: See `API_DOCUMENTATION.md`
- **Integration Guide**: See `INTEGRATION_GUIDE.md`
- **Example Code**: See `simple_integration_example.py`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

---

**Ready to integrate secure medical image processing into your application!** 🎉 