.class Lcom/android/launcher3/anim/C$b;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "AppOCAnimHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/C;->v0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic i:F

.field final synthetic j:F

.field final synthetic k:Landroid/view/animation/Interpolator;

.field final synthetic l:F

.field final synthetic m:F

.field final synthetic n:Landroid/view/animation/Interpolator;

.field final synthetic o:Z

.field final synthetic p:Lcom/android/launcher3/folder/Folder;

.field final synthetic q:Lcom/android/launcher3/Workspace;

.field final synthetic r:Lcom/android/launcher3/Hotseat;

.field final synthetic s:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

.field final synthetic t:Lcom/android/launcher3/LongClickTextView;

.field final synthetic u:Lcom/android/launcher3/anim/C;


# direct methods
.method constructor <init>(FFLandroid/view/animation/Interpolator;FFLandroid/view/animation/Interpolator;ZLcom/android/launcher3/folder/Folder;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Lcom/android/launcher3/anim/C;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/C$b;->i:F

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/anim/C$b;->j:F

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/anim/C$b;->k:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/anim/C$b;->l:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/anim/C$b;->m:F

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/anim/C$b;->n:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    iput-boolean p7, p0, Lcom/android/launcher3/anim/C$b;->o:Z

    .line 14
    .line 15
    iput-object p8, p0, Lcom/android/launcher3/anim/C$b;->p:Lcom/android/launcher3/folder/Folder;

    .line 16
    .line 17
    iput-object p9, p0, Lcom/android/launcher3/anim/C$b;->q:Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    iput-object p10, p0, Lcom/android/launcher3/anim/C$b;->r:Lcom/android/launcher3/Hotseat;

    .line 20
    .line 21
    iput-object p11, p0, Lcom/android/launcher3/anim/C$b;->s:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 22
    .line 23
    iput-object p12, p0, Lcom/android/launcher3/anim/C$b;->t:Lcom/android/launcher3/LongClickTextView;

    .line 24
    .line 25
    iput-object p13, p0, Lcom/android/launcher3/anim/C$b;->u:Lcom/android/launcher3/anim/C;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance p7, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 31
    .line 32
    invoke-direct {p7, p0, p1, p2, p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 33
    .line 34
    .line 35
    iput-object p7, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 36
    .line 37
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 38
    .line 39
    invoke-direct {p1, p0, p4, p5, p6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_4

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_4

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 14
    .line 15
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_4

    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 24
    .line 25
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 26
    .line 27
    invoke-static {p2}, Ljava/lang/Float;->isInfinite(F)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/anim/C$b;->o:Z

    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->p:Lcom/android/launcher3/folder/Folder;

    .line 40
    .line 41
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 42
    .line 43
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->p:Lcom/android/launcher3/folder/Folder;

    .line 49
    .line 50
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 51
    .line 52
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->p:Lcom/android/launcher3/folder/Folder;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 60
    .line 61
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->q:Lcom/android/launcher3/Workspace;

    .line 68
    .line 69
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 70
    .line 71
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->q:Lcom/android/launcher3/Workspace;

    .line 77
    .line 78
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 79
    .line 80
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->q:Lcom/android/launcher3/Workspace;

    .line 86
    .line 87
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 88
    .line 89
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->r:Lcom/android/launcher3/Hotseat;

    .line 95
    .line 96
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 97
    .line 98
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->r:Lcom/android/launcher3/Hotseat;

    .line 104
    .line 105
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 106
    .line 107
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->r:Lcom/android/launcher3/Hotseat;

    .line 113
    .line 114
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 115
    .line 116
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->s:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 122
    .line 123
    if-eqz p1, :cond_2

    .line 124
    .line 125
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 126
    .line 127
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 128
    .line 129
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->s:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 133
    .line 134
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 135
    .line 136
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setScaleX(F)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->s:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 142
    .line 143
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 144
    .line 145
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setScaleY(F)V

    .line 148
    .line 149
    .line 150
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->t:Lcom/android/launcher3/LongClickTextView;

    .line 151
    .line 152
    if-eqz p1, :cond_3

    .line 153
    .line 154
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 155
    .line 156
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Lcom/android/launcher3/LongClickTextView;->setAlpha(F)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->t:Lcom/android/launcher3/LongClickTextView;

    .line 162
    .line 163
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 164
    .line 165
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 166
    .line 167
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setScaleX(F)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->t:Lcom/android/launcher3/LongClickTextView;

    .line 171
    .line 172
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 173
    .line 174
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setScaleY(F)V

    .line 177
    .line 178
    .line 179
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->u:Lcom/android/launcher3/anim/C;

    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iget-object p2, p0, Lcom/android/launcher3/anim/C$b;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 186
    .line 187
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 188
    .line 189
    iput p2, p1, Lu2/e;->l:F

    .line 190
    .line 191
    iget-object p1, p0, Lcom/android/launcher3/anim/C$b;->u:Lcom/android/launcher3/anim/C;

    .line 192
    .line 193
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iget-object p0, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 198
    .line 199
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 200
    .line 201
    iput p0, p1, Lu2/e;->k:F

    .line 202
    .line 203
    return-void

    .line 204
    :cond_4
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    const-string v0, "percent-"

    .line 210
    .line 211
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string p1, "-mScale-"

    .line 218
    .line 219
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget-object p0, p0, Lcom/android/launcher3/anim/C$b;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 223
    .line 224
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 225
    .line 226
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    const-string p1, "AppOCAnimHelper"

    .line 234
    .line 235
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    return-void
.end method
