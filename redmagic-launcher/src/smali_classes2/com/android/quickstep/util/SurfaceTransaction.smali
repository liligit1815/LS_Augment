.class public Lcom/android/quickstep/util/SurfaceTransaction;
.super Ljava/lang/Object;
.source "SurfaceTransaction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;,
        Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceTransaction"


# instance fields
.field private isFromTaskViewSimulator:Z

.field private final mTmpValues:[F

.field private final mTransaction:Landroid/view/SurfaceControl$Transaction;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    const/16 v0, 0x9

    .line 12
    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->mTmpValues:[F

    .line 16
    .line 17
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/SurfaceTransaction;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->mTmpValues:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    return-object p0
.end method

.method public static createParamForTaskLayerRestore(I[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/anim/C;)Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 9

    .line 1
    sget-boolean v0, LU2/a;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    new-instance v0, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    array-length v2, p1

    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    if-ge v4, v2, :cond_4

    .line 16
    .line 17
    aget-object v5, p1, v4

    .line 18
    .line 19
    invoke-static {v5}, LU2/a$a;->a(Landroid/view/RemoteAnimationTarget;)Landroid/view/SurfaceControl;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    new-instance v7, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v8, "Restore, taskLeash.isValid = "

    .line 26
    .line 27
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    invoke-virtual {v6}, Landroid/view/SurfaceControl;->isValid()Z

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    goto :goto_1

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_1
    move-object v8, v1

    .line 45
    :goto_1
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v8, ", it.mode = "

    .line 49
    .line 50
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget v8, v5, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 54
    .line 55
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v8, ", targetMode = "

    .line 59
    .line 60
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v8, "SurfaceTransaction"

    .line 67
    .line 68
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    iget v7, v5, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 76
    .line 77
    if-ne v7, p0, :cond_3

    .line 78
    .line 79
    invoke-virtual {p2}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    iget-object v8, v5, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 84
    .line 85
    if-eqz v8, :cond_2

    .line 86
    .line 87
    invoke-virtual {v8}, Landroid/view/SurfaceControl;->isValid()Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    if-eqz v8, :cond_2

    .line 92
    .line 93
    if-eqz v7, :cond_2

    .line 94
    .line 95
    invoke-virtual {v7}, Lu2/e;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    if-eqz v8, :cond_2

    .line 100
    .line 101
    iget-object v5, v5, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 102
    .line 103
    invoke-virtual {v0, v5}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-virtual {v7}, Lu2/e;->d()Landroid/graphics/Matrix;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-virtual {v5, v8}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-virtual {v7}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    invoke-virtual {v5, v8}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v7}, Lu2/e;->e()F

    .line 124
    .line 125
    .line 126
    move-result v8

    .line 127
    invoke-virtual {v5, v8}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-virtual {v7}, Lu2/e;->f()F

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 136
    .line 137
    .line 138
    :cond_2
    if-eqz v6, :cond_3

    .line 139
    .line 140
    invoke-virtual {v6}, Landroid/view/SurfaceControl;->isValid()Z

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    if-eqz v5, :cond_3

    .line 145
    .line 146
    invoke-virtual {v0, v6}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    new-instance v6, Landroid/graphics/Matrix;

    .line 151
    .line 152
    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 153
    .line 154
    .line 155
    const/4 v7, 0x0

    .line 156
    invoke-virtual {v6, v7, v7}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 157
    .line 158
    .line 159
    const/high16 v7, 0x3f800000    # 1.0f

    .line 160
    .line 161
    invoke-virtual {v6, v7, v7}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    new-instance v6, Landroid/graphics/Rect;

    .line 169
    .line 170
    const/4 v8, -0x1

    .line 171
    invoke-direct {v6, v3, v3, v8, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 179
    .line 180
    .line 181
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_4
    invoke-virtual {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->getTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .line 191
    .line 192
    return-object v0

    .line 193
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 194
    .line 195
    .line 196
    return-object v0
.end method


# virtual methods
.method public forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;-><init>(Lcom/android/quickstep/util/SurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance p1, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;-><init>(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public getTransaction()Landroid/view/SurfaceControl$Transaction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    return-object p0
.end method

.method public isFromTaskViewSimulator()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->isFromTaskViewSimulator:Z

    .line 2
    .line 3
    return p0
.end method

.method public setFromTaskViewSimulator(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/SurfaceTransaction;->isFromTaskViewSimulator:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVsyncId()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SurfaceTransaction;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-static {}, Landroid/view/Choreographer;->getSfInstance()Landroid/view/Choreographer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/Choreographer;->getVsyncId()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setFrameTimelineVsync(J)Landroid/view/SurfaceControl$Transaction;

    .line 12
    .line 13
    .line 14
    return-void
.end method
