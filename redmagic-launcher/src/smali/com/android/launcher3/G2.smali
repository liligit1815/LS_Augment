.class public Lcom/android/launcher3/G2;
.super Ljava/lang/Object;
.source "LauncherAnimUtils.java"


# static fields
.field public static final a:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Lcom/android/launcher3/util/y1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/y1<",
            "Lcom/android/launcher3/Workspace<",
            "*>;>;"
        }
    .end annotation
.end field

.field public static final d:Lcom/android/launcher3/util/y1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/y1<",
            "Lcom/android/launcher3/Hotseat;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/view/ViewGroup$LayoutParams;",
            ">;"
        }
    .end annotation
.end field

.field public static final f:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/view/ViewGroup$LayoutParams;",
            ">;"
        }
    .end annotation
.end field

.field public static final g:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field public static final i:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final j:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final k:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final l:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final m:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field public static final n:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final o:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field static p:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/animation/Animator;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static q:Landroid/animation/Animator$AnimatorListener;

.field static r:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/animation/Animator;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static s:Landroid/animation/Animator$AnimatorListener;

.field public static final t:Lcom/android/launcher3/util/y1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/y1<",
            "Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;",
            ">;"
        }
    .end annotation
.end field

.field public static final u:Lcom/android/launcher3/util/y1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/y1<",
            "Lcom/android/launcher3/LongClickTextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/G2$h;

    .line 2
    .line 3
    const-string v1, "drawableAlpha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$h;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/G2;->a:Landroid/util/IntProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/G2$i;

    .line 11
    .line 12
    const-string v1, "scale"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$i;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/util/y1;

    .line 20
    .line 21
    const-string v1, "workspace_scale_property"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/y1;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/G2;->c:Lcom/android/launcher3/util/y1;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/util/y1;

    .line 29
    .line 30
    const-string v1, "hotseat_scale_property"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/y1;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/G2;->d:Lcom/android/launcher3/util/y1;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/G2$j;

    .line 38
    .line 39
    const-string v1, "width"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$j;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/android/launcher3/G2;->e:Landroid/util/IntProperty;

    .line 45
    .line 46
    new-instance v0, Lcom/android/launcher3/G2$k;

    .line 47
    .line 48
    const-string v1, "height"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$k;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/android/launcher3/G2;->f:Landroid/util/IntProperty;

    .line 54
    .line 55
    new-instance v0, Lcom/android/launcher3/G2$l;

    .line 56
    .line 57
    const-string v1, "textColor"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$l;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/android/launcher3/G2;->g:Landroid/util/IntProperty;

    .line 63
    .line 64
    new-instance v0, Lcom/android/launcher3/G2$m;

    .line 65
    .line 66
    const-string v1, "hintTextColor"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$m;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/android/launcher3/G2;->h:Landroid/util/IntProperty;

    .line 72
    .line 73
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 74
    .line 75
    instance-of v1, v0, Landroid/util/FloatProperty;

    .line 76
    .line 77
    if-eqz v1, :cond_0

    .line 78
    .line 79
    check-cast v0, Landroid/util/FloatProperty;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    new-instance v0, Lcom/android/launcher3/G2$n;

    .line 83
    .line 84
    const-string v1, "translateX"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$n;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :goto_0
    sput-object v0, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 90
    .line 91
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 92
    .line 93
    instance-of v1, v0, Landroid/util/FloatProperty;

    .line 94
    .line 95
    if-eqz v1, :cond_1

    .line 96
    .line 97
    check-cast v0, Landroid/util/FloatProperty;

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    new-instance v0, Lcom/android/launcher3/G2$o;

    .line 101
    .line 102
    const-string v1, "translateY"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$o;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :goto_1
    sput-object v0, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 108
    .line 109
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 110
    .line 111
    instance-of v1, v0, Landroid/util/FloatProperty;

    .line 112
    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    check-cast v0, Landroid/util/FloatProperty;

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_2
    new-instance v0, Lcom/android/launcher3/G2$p;

    .line 119
    .line 120
    const-string v1, "alpha"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$p;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :goto_2
    sput-object v0, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 126
    .line 127
    new-instance v0, Lcom/android/launcher3/G2$a;

    .line 128
    .line 129
    const-string v1, "backgroundColor"

    .line 130
    .line 131
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$a;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/android/launcher3/G2;->l:Landroid/util/IntProperty;

    .line 135
    .line 136
    new-instance v0, Lcom/android/launcher3/G2$b;

    .line 137
    .line 138
    const-string v1, "drawableRotationPercent"

    .line 139
    .line 140
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$b;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sput-object v0, Lcom/android/launcher3/G2;->m:Landroid/util/FloatProperty;

    .line 144
    .line 145
    sget-object v0, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 146
    .line 147
    instance-of v1, v0, Landroid/util/FloatProperty;

    .line 148
    .line 149
    if-eqz v1, :cond_3

    .line 150
    .line 151
    check-cast v0, Landroid/util/FloatProperty;

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_3
    new-instance v0, Lcom/android/launcher3/G2$d;

    .line 155
    .line 156
    const-string v1, "scaleX"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$d;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :goto_3
    sput-object v0, Lcom/android/launcher3/G2;->n:Landroid/util/FloatProperty;

    .line 162
    .line 163
    sget-object v0, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 164
    .line 165
    instance-of v1, v0, Landroid/util/FloatProperty;

    .line 166
    .line 167
    if-eqz v1, :cond_4

    .line 168
    .line 169
    check-cast v0, Landroid/util/FloatProperty;

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_4
    new-instance v0, Lcom/android/launcher3/G2$e;

    .line 173
    .line 174
    const-string v1, "scaleY"

    .line 175
    .line 176
    invoke-direct {v0, v1}, Lcom/android/launcher3/G2$e;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :goto_4
    sput-object v0, Lcom/android/launcher3/G2;->o:Landroid/util/FloatProperty;

    .line 180
    .line 181
    new-instance v0, Ljava/util/WeakHashMap;

    .line 182
    .line 183
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 184
    .line 185
    .line 186
    sput-object v0, Lcom/android/launcher3/G2;->p:Ljava/util/WeakHashMap;

    .line 187
    .line 188
    new-instance v0, Lcom/android/launcher3/G2$f;

    .line 189
    .line 190
    invoke-direct {v0}, Lcom/android/launcher3/G2$f;-><init>()V

    .line 191
    .line 192
    .line 193
    sput-object v0, Lcom/android/launcher3/G2;->q:Landroid/animation/Animator$AnimatorListener;

    .line 194
    .line 195
    new-instance v0, Ljava/util/WeakHashMap;

    .line 196
    .line 197
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 198
    .line 199
    .line 200
    sput-object v0, Lcom/android/launcher3/G2;->r:Ljava/util/WeakHashMap;

    .line 201
    .line 202
    new-instance v0, Lcom/android/launcher3/G2$g;

    .line 203
    .line 204
    invoke-direct {v0}, Lcom/android/launcher3/G2$g;-><init>()V

    .line 205
    .line 206
    .line 207
    sput-object v0, Lcom/android/launcher3/G2;->s:Landroid/animation/Animator$AnimatorListener;

    .line 208
    .line 209
    new-instance v0, Lcom/android/launcher3/util/y1;

    .line 210
    .line 211
    const-string v1, "mfvPageIndicatorLayout_scale_property"

    .line 212
    .line 213
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/y1;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    sput-object v0, Lcom/android/launcher3/G2;->t:Lcom/android/launcher3/util/y1;

    .line 217
    .line 218
    new-instance v0, Lcom/android/launcher3/util/y1;

    .line 219
    .line 220
    const-string v1, "longClickTextView_scale_property"

    .line 221
    .line 222
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/y1;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    sput-object v0, Lcom/android/launcher3/G2;->u:Lcom/android/launcher3/util/y1;

    .line 226
    .line 227
    return-void
.end method

.method public static a(F)I
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr p0, v0

    .line 8
    const/high16 v1, 0x40c00000    # 6.0f

    .line 9
    .line 10
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    float-to-int p0, p0

    .line 15
    return p0
.end method

.method public static b(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/G2;->q:Landroid/animation/Animator$AnimatorListener;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/G2;->s:Landroid/animation/Animator$AnimatorListener;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static d()Landroid/animation/AnimatorSet;
    .locals 1

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/G2;->b(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static e()Landroid/animation/AnimatorSet;
    .locals 1

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/G2;->c(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static f(Ljava/lang/Runnable;Z)Landroid/animation/Animator$AnimatorListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/G2$c;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/G2$c;-><init>(ZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static g(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lcom/android/launcher3/G2;->f(Ljava/lang/Runnable;Z)Landroid/animation/Animator$AnimatorListener;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static varargs h(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;[F)",
            "Landroid/animation/ObjectAnimator;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/G2;->b(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Lcom/android/launcher3/w0;

    .line 9
    .line 10
    invoke-direct {p2, p0}, Lcom/android/launcher3/w0;-><init>(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public static varargs i([F)Landroid/animation/ValueAnimator;
    .locals 1

    .line 1
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/G2;->b(Landroid/animation/Animator;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static j()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/G2;->r:Ljava/util/WeakHashMap;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroid/animation/Animator;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 35
    .line 36
    .line 37
    :cond_0
    sget-object v2, Lcom/android/launcher3/G2;->r:Ljava/util/WeakHashMap;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method
