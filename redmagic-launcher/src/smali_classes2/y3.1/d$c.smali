.class final Ly3/d$c;
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


# direct methods
.method constructor <init>(Ly3/d;Landroid/os/VibrationEffect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly3/d$c;->g:Ly3/d;

    .line 2
    .line 3
    iput-object p2, p0, Ly3/d$c;->h:Landroid/os/VibrationEffect;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ly3/d$c;->g:Ly3/d;

    .line 2
    .line 3
    invoke-static {v0}, Ly3/d;->d(Ly3/d;)Landroid/os/Vibrator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ly3/d$c;->h:Landroid/os/VibrationEffect;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
