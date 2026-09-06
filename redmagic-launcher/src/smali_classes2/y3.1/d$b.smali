.class final Ly3/d$b;
.super Ljava/lang/Object;
.source "MSDLPlayerImpl.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ly3/d;->f(Lw3/e;Ly3/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final synthetic g:Ly3/d;

.field final synthetic h:Landroid/os/VibrationEffect;

.field final synthetic i:Landroid/os/VibrationAttributes;


# direct methods
.method constructor <init>(Ly3/d;Landroid/os/VibrationEffect;Landroid/os/VibrationAttributes;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly3/d$b;->g:Ly3/d;

    .line 2
    .line 3
    iput-object p2, p0, Ly3/d$b;->h:Landroid/os/VibrationEffect;

    .line 4
    .line 5
    iput-object p3, p0, Ly3/d$b;->i:Landroid/os/VibrationAttributes;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly3/d$b;->g:Ly3/d;

    .line 2
    .line 3
    invoke-static {v0}, Ly3/d;->d(Ly3/d;)Landroid/os/Vibrator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ly3/d$b;->h:Landroid/os/VibrationEffect;

    .line 8
    .line 9
    iget-object p0, p0, Ly3/d$b;->i:Landroid/os/VibrationAttributes;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/os/VibrationAttributes;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
