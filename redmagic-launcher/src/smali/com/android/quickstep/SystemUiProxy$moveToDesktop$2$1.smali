.class public final Lcom/android/quickstep/SystemUiProxy$moveToDesktop$2$1;
.super Lcom/android/wm/shell/desktopmode/d$a;
.source "SystemUiProxy.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/SystemUiProxy;->moveToDesktop(ILO2/e;Landroid/window/RemoteTransition;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $successCallback:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy$moveToDesktop$2$1;->$successCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/wm/shell/desktopmode/d$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTaskMovedToDesktop()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy$moveToDesktop$2$1;->$successCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
