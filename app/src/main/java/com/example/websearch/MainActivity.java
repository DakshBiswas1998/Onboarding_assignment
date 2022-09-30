package com.example.websearch;

import android.content.Intent;
import android.net.Uri;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText editText;
    Button button;
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle("Testing App for Appium Cucumber assignment");
        setContentView(R.layout.activity_main);

        editText = findViewById(R.id.urltxt);
        button = findViewById(R.id.gotoURL);
        textView = findViewById(R.id.txtview);

        button.setOnClickListener(view -> {
            String url = editText.getText().toString();
            Intent urlIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(textView.getText().toString() + url));
            startActivity(urlIntent);
        });
    }
}
