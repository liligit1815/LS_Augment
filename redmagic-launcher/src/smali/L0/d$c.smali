.class final LL0/d$c;
.super Ljava/lang/Object;
.source "SettingsAwareViewCapture.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/d;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final synthetic g:LL0/d;


# direct methods
.method constructor <init>(LL0/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LL0/d$c;->g:LL0/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, LL0/d$c;->g:LL0/d;

    .line 2
    .line 3
    invoke-static {v0}, LL0/d;->u(LL0/d;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "view_capture_enabled"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    :cond_0
    sget-object v0, LL0/n;->h:LL0/a;

    .line 22
    .line 23
    new-instance v1, LL0/d$c$a;

    .line 24
    .line 25
    iget-object v3, p0, LL0/d$c;->g:LL0/d;

    .line 26
    .line 27
    invoke-direct {v1, v3, v2}, LL0/d$c$a;-><init>(LL0/d;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, LL0/a;->execute(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, LL0/d$c;->g:LL0/d;

    .line 34
    .line 35
    invoke-static {v0}, LL0/d;->u(LL0/d;)Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, LL0/d$c;->g:LL0/d;

    .line 52
    .line 53
    invoke-static {p0}, LL0/d;->v(LL0/d;)Landroid/window/IDumpCallback$Stub;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Landroid/content/pm/LauncherApps;->registerDumpCallback(Landroid/window/IDumpCallback;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, LL0/d$c;->g:LL0/d;

    .line 64
    .line 65
    invoke-static {p0}, LL0/d;->v(LL0/d;)Landroid/window/IDumpCallback$Stub;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Landroid/content/pm/LauncherApps;->unRegisterDumpCallback(Landroid/window/IDumpCallback;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method
