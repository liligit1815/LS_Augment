.class final LL0/d$a;
.super Ljava/lang/Object;
.source "SettingsAwareViewCapture.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/d;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V
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
    iput-object p1, p0, LL0/d$a;->g:LL0/d;

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
    iget-object v0, p0, LL0/d$a;->g:LL0/d;

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
    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Landroid/os/Handler;

    .line 18
    .line 19
    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v3, LL0/d$a$a;

    .line 23
    .line 24
    iget-object p0, p0, LL0/d$a;->g:LL0/d;

    .line 25
    .line 26
    invoke-direct {v3, p0, v2}, LL0/d$a$a;-><init>(LL0/d;Landroid/os/Handler;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {v0, v1, p0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
