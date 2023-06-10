for(int i = 0; i < a.length; i++) {
    for(int j = 0; j < a.length; j++) {
        for(int k = 0; k < a.length; k++) {
            a[j][k] = a[j][k] || (a[j][i] && a[i][k]);
        }
    }
}