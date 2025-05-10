FROM python:3.10-slim-buster

WORKDIR /app

# Install necessary Python libraries
RUN pip install --upgrade pip
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 # Or appropriate CUDA version if considering GPU
RUN pip install transformers fastapi uvicorn

# (Conceptual) Download the pre-trained LLM (will be done in the inference script later)
# RUN python -c "from transformers import AutoTokenizer, AutoModelForCausalLM; tokenizer = AutoTokenizer.from_pretrained('bert-large-uncased'); model = AutoModelForCausalLM.from_pretrained('bert-large-uncased')"

# (Placeholder) Copy your inference script (will be created in the next step)
COPY inference.py .

CMD ["uvicorn", "inference:app", "--host", "0.0.0.0", "--port", "8080"]
