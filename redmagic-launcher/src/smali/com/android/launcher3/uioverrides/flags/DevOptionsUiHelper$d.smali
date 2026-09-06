.class public final Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;
.super Landroid/content/IIntentSender$Stub;
.source "DevOptionsUiHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->N1(Ljava/lang/String;Ljava/util/concurrent/Executor;Lu4/l;)Landroid/content/Intent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/concurrent/Executor;

.field final synthetic h:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/net/Uri;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Lu4/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lu4/l<",
            "-",
            "Landroid/net/Uri;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;->g:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;->h:Lu4/l;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/content/IIntentSender$Stub;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o2(Lu4/l;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;->p2(Lu4/l;Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final p2(Lu4/l;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public send(ILandroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Landroid/content/IIntentReceiver;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const-string p1, "intent"

    .line 2
    .line 3
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;->g:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$d;->h:Lu4/l;

    .line 15
    .line 16
    new-instance p3, Ld2/t;

    .line 17
    .line 18
    invoke-direct {p3, p0, p1}, Ld2/t;-><init>(Lu4/l;Landroid/net/Uri;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p2, p3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
