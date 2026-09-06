.class public final Lcom/android/quickstep/util/animation/SpringAnimationImpl;
.super Ljava/lang/Object;
.source "SpringAnimationImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;,
        Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;
    }
.end annotation


# static fields
.field private static final ALPHA:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

.field private static final SCALE:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "SpringAnimationImpl"


# instance fields
.field private mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

.field private mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

.field private mTargetView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$1;

    .line 10
    .line 11
    const-string v1, "View_Scale"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$1;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->SCALE:Landroid/util/FloatProperty;

    .line 17
    .line 18
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$2;

    .line 19
    .line 20
    const-string v1, "View_Alpha"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$2;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->ALPHA:Landroid/util/FloatProperty;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mTargetView"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 10
    .line 11
    return-void
.end method

.method private static final createDefaultSpringAnim(Landroid/view/View;Landroid/util/FloatProperty;F)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;F)",
            "Lcom/android/quickstep/util/animation/SpringAnimation;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->createDefaultSpringAnim(Landroid/view/View;Landroid/util/FloatProperty;F)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private static final getScaledStiffness(F)F
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public final alphaTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 4

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v3, "alphaTo, animate: "

    .line 26
    .line 27
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v3, ", running: "

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, ", "

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, " to "

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, " stiffness "

    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, " damping "

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, " mTargetView:"

    .line 74
    .line 75
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, "SpringAnimationImpl"

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 91
    .line 92
    if-nez v0, :cond_2

    .line 93
    .line 94
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 95
    .line 96
    iget-object v1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 97
    .line 98
    sget-object v2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->ALPHA:Landroid/util/FloatProperty;

    .line 99
    .line 100
    const/high16 v3, 0x3f800000    # 1.0f

    .line 101
    .line 102
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->createDefaultSpringAnim(Landroid/view/View;Landroid/util/FloatProperty;F)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 107
    .line 108
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    const v1, 0x3b03126f    # 0.002f

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 115
    .line 116
    .line 117
    :cond_2
    if-nez p1, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 120
    .line 121
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_3

    .line 129
    .line 130
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 131
    .line 132
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-object p0

    .line 136
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 137
    .line 138
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_4

    .line 146
    .line 147
    sget-object p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->ALPHA:Landroid/util/FloatProperty;

    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 150
    .line 151
    invoke-virtual {p1, v0, p2}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 152
    .line 153
    .line 154
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 155
    .line 156
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    sget-object p2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 168
    .line 169
    invoke-virtual {p2, p4}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1, p5}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 181
    .line 182
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    return-object p0
.end method

.method public final cancelDragLayerAlphaAnimImmediately()V
    .locals 0

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final cancelImmediately()V
    .locals 1

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mAlphaSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public final scaleTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 4

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v3, "scaleTo, animate: "

    .line 26
    .line 27
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v3, ", running: "

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, ", "

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, " to "

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, " mTargetView:"

    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, "SpringAnimationImpl"

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 75
    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 81
    .line 82
    sget-object v2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->SCALE:Landroid/util/FloatProperty;

    .line 83
    .line 84
    const/high16 v3, 0x3f800000    # 1.0f

    .line 85
    .line 86
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->createDefaultSpringAnim(Landroid/view/View;Landroid/util/FloatProperty;F)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 91
    .line 92
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    const v1, 0x3a83126f    # 0.001f

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 99
    .line 100
    .line 101
    :cond_2
    if-nez p1, :cond_3

    .line 102
    .line 103
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 104
    .line 105
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_3

    .line 113
    .line 114
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 115
    .line 116
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-object p0

    .line 120
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 121
    .line 122
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-nez p1, :cond_4

    .line 130
    .line 131
    sget-object p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->SCALE:Landroid/util/FloatProperty;

    .line 132
    .line 133
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mTargetView:Landroid/view/View;

    .line 134
    .line 135
    invoke-virtual {p1, v0, p2}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 136
    .line 137
    .line 138
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 139
    .line 140
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    sget-object p2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 152
    .line 153
    invoke-virtual {p2, p4}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1, p5}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 162
    .line 163
    .line 164
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->mScaleSpringAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 165
    .line 166
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    return-object p0
.end method
