.class public Lcom/android/launcher3/util/V2;
.super Ljava/lang/Object;
.source "VibratorWrapper.java"


# static fields
.field public static final e:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/V2;",
            ">;"
        }
    .end annotation
.end field

.field public static final f:Landroid/media/AudioAttributes;

.field public static final g:Landroid/os/VibrationEffect;

.field static final h:Landroid/net/Uri;

.field public static final i:Landroid/os/VibrationEffect;


# instance fields
.field private final a:Landroid/os/Vibrator;

.field private final b:Z

.field final c:Lcom/android/launcher3/util/p2$a;

.field private d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/O2;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/O2;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 16
    .line 17
    .line 18
    const/16 v1, 0xd

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x4

    .line 25
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/android/launcher3/util/V2;->f:Landroid/media/AudioAttributes;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-static {v0}, Landroid/os/VibrationEffect;->createPredefined(I)Landroid/os/VibrationEffect;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Lcom/android/launcher3/util/V2;->g:Landroid/os/VibrationEffect;

    .line 41
    .line 42
    const-string v1, "haptic_feedback_enabled"

    .line 43
    .line 44
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sput-object v1, Lcom/android/launcher3/util/V2;->h:Landroid/net/Uri;

    .line 49
    .line 50
    sput-object v0, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/K;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/S2;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/S2;-><init>(Lcom/android/launcher3/util/V2;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/util/V2;->c:Lcom/android/launcher3/util/p2$a;

    .line 10
    .line 11
    const-class v0, Landroid/os/Vibrator;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/os/Vibrator;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/os/Vibrator;->hasVibrator()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput-boolean p1, p0, Lcom/android/launcher3/util/V2;->b:Z

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 31
    .line 32
    new-instance v1, Lcom/android/launcher3/util/T2;

    .line 33
    .line 34
    invoke-direct {v1, p0, p2}, Lcom/android/launcher3/util/T2;-><init>(Lcom/android/launcher3/util/V2;Lcom/android/launcher3/util/p2;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/android/launcher3/util/V2;->h:Landroid/net/Uri;

    .line 41
    .line 42
    invoke-virtual {p2, p1, v0}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput-boolean p1, p0, Lcom/android/launcher3/util/V2;->d:Z

    .line 47
    .line 48
    new-instance p1, Lcom/android/launcher3/util/U2;

    .line 49
    .line 50
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/util/U2;-><init>(Lcom/android/launcher3/util/V2;Lcom/android/launcher3/util/p2;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iput-boolean v0, p0, Lcom/android/launcher3/util/V2;->d:Z

    .line 58
    .line 59
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/V2;Lcom/android/launcher3/util/p2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/V2;->j(Lcom/android/launcher3/util/p2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/V2;Lcom/android/launcher3/util/p2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/V2;->i(Lcom/android/launcher3/util/p2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/V2;Landroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/V2;->k(Landroid/os/VibrationEffect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/V2;IFLandroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/util/V2;->l(IFLandroid/os/VibrationEffect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/util/V2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/V2;->h(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/util/V2;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic i(Lcom/android/launcher3/util/p2;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/V2;->h:Landroid/net/Uri;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/V2;->c:Lcom/android/launcher3/util/p2$a;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic j(Lcom/android/launcher3/util/p2;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/V2;->h:Landroid/net/Uri;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/V2;->c:Lcom/android/launcher3/util/p2$a;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic k(Landroid/os/VibrationEffect;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/V2;->f:Landroid/media/AudioAttributes;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/media/AudioAttributes;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v0, "vibrate: "

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "VibratorWrapper"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic l(IFLandroid/os/VibrationEffect;)V
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 4
    .line 5
    filled-new-array {p1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Vibrator;->areAllPrimitivesSupported([I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/VibrationEffect;->startComposition()Landroid/os/VibrationEffect$Composition;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p3, p1, p2}, Landroid/os/VibrationEffect$Composition;->addPrimitive(IF)Landroid/os/VibrationEffect$Composition;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/os/VibrationEffect$Composition;->compose()Landroid/os/VibrationEffect;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object p2, Lcom/android/launcher3/util/V2;->f:Landroid/media/AudioAttributes;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/media/AudioAttributes;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 36
    .line 37
    sget-object p1, Lcom/android/launcher3/util/V2;->f:Landroid/media/AudioAttributes;

    .line 38
    .line 39
    invoke-virtual {p0, p3, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/media/AudioAttributes;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catch_0
    move-exception p0

    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string p2, "vibrate: "

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "VibratorWrapper"

    .line 62
    .line 63
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/android/launcher3/util/Q2;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/Q2;-><init>(Landroid/os/Vibrator;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/V2;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/util/V2;->d:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public m(IFLandroid/os/VibrationEffect;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/V2;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/util/V2;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/util/R2;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/util/R2;-><init>(Lcom/android/launcher3/util/V2;IFLandroid/os/VibrationEffect;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public n(Landroid/os/VibrationEffect;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/V2;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/util/V2;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/util/P2;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/util/P2;-><init>(Lcom/android/launcher3/util/V2;Landroid/os/VibrationEffect;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/V2;->a:Landroid/os/Vibrator;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    filled-new-array {v1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Landroid/os/Vibrator;->areAllPrimitivesSupported([I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/VibrationEffect;->startComposition()Landroid/os/VibrationEffect$Composition;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v2, 0x3f666666    # 0.9f

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/os/VibrationEffect$Composition;->addPrimitive(IF)Landroid/os/VibrationEffect$Composition;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/os/VibrationEffect$Composition;->compose()Landroid/os/VibrationEffect;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
