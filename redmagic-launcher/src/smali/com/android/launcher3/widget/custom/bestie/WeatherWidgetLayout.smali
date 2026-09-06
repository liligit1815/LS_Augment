.class public Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;
.super Ll2/V;
.source "WeatherWidgetLayout.java"


# instance fields
.field private g:Landroid/view/View;

.field private h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Ll2/V;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->b(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "WeatherWidgetLayout"

    .line 2
    .line 3
    const-string v0, "onFinishInflate: onClick"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, v0}, La1/d;->u(Landroid/content/Context;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, La1/d;->A(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1, p0}, La1/d;->g(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    const-string v0, "WeatherWidgetLayout"

    .line 2
    .line 3
    const-string v1, "onClick: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, v1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {}, La1/d;->p()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    const-string v1, "com.zte.weather.ui.HomeActivity"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string v1, "com.zte.mifavorpad.weather.adver.SplashActivity"

    .line 36
    .line 37
    :goto_0
    invoke-static {v0, p0, v1}, La1/d;->y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1}, La1/d;->u(Landroid/content/Context;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, La1/d;->A(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0, p0}, La1/d;->g(Landroid/content/Context;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method protected onFinishInflate()V
    .locals 9

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, La1/d;->p()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "com.zte.weather"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v0, "com.zte.mifavorpad.weather"

    .line 14
    .line 15
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 16
    .line 17
    const v0, 0x7f0b067c

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;

    .line 25
    .line 26
    const v1, 0x7f0b01ed

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/widget/LinearLayout;

    .line 34
    .line 35
    const v2, 0x7f0b01ee

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v3, v4}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_5

    .line 55
    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    if-eqz v2, :cond_4

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v3, "bestie_weather_widget_id"

    .line 88
    .line 89
    const/4 v4, -0x1

    .line 90
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    new-instance v5, Lcom/android/launcher3/model/data/A;

    .line 95
    .line 96
    new-instance v6, Landroid/content/ComponentName;

    .line 97
    .line 98
    iget-object v7, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->h:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {}, La1/d;->p()Z

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    if-eqz v8, :cond_1

    .line 105
    .line 106
    const-string v8, "com.zte.weather.widget.launcher.WeatherAppWidgetProvider"

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    const-string v8, "com.zte.mifavorpad.weather.widget.launcher.WeatherBestieAppWidget"

    .line 110
    .line 111
    :goto_1
    invoke-direct {v6, v7, v8}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {v5, v2, v6}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    .line 115
    .line 116
    .line 117
    if-ne v2, v4, :cond_2

    .line 118
    .line 119
    const/4 v4, 0x3

    .line 120
    iput v4, v5, Lcom/android/launcher3/model/data/A;->i:I

    .line 121
    .line 122
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v4, v5, v0}, Lcom/android/launcher3/util/B0;->f(Lcom/android/launcher3/model/data/A;Lz1/J3;)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->g:Landroid/view/View;

    .line 135
    .line 136
    if-eqz v0, :cond_3

    .line 137
    .line 138
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v1, "widgetId savedId: "

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v1, " new id: "

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget v1, v5, Lcom/android/launcher3/model/data/A;->g:I

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "WeatherWidgetLayout"

    .line 169
    .line 170
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    iget v0, v5, Lcom/android/launcher3/model/data/A;->g:I

    .line 174
    .line 175
    if-eq v2, v0, :cond_4

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    iget v0, v5, Lcom/android/launcher3/model/data/A;->g:I

    .line 190
    .line 191
    invoke-interface {p0, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 196
    .line 197
    .line 198
    :cond_4
    return-void

    .line 199
    :cond_5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    const v4, 0x7f080a67

    .line 204
    .line 205
    .line 206
    invoke-virtual {v3, v4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 211
    .line 212
    .line 213
    const/4 v0, 0x0

    .line 214
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 215
    .line 216
    .line 217
    new-instance v0, Ll2/T;

    .line 218
    .line 219
    invoke-direct {v0, p0}, Ll2/T;-><init>(Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->g:Landroid/view/View;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->g:Landroid/view/View;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->measure(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
