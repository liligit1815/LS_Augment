.class public abstract Lcom/zte/mifavor/launcher/adapter/compat/c;
.super Ljava/lang/Object;
.source "SysAdapterInterface.java"


# static fields
.field private static a:Lcom/zte/mifavor/launcher/adapter/compat/d;

.field private static b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/mifavor/launcher/adapter/compat/c;->b:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()Lcom/zte/mifavor/launcher/adapter/compat/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/zte/mifavor/launcher/adapter/compat/c;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/zte/mifavor/launcher/adapter/compat/c;->a:Lcom/zte/mifavor/launcher/adapter/compat/d;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/zte/mifavor/launcher/adapter/compat/d;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/zte/mifavor/launcher/adapter/compat/d;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/zte/mifavor/launcher/adapter/compat/c;->a:Lcom/zte/mifavor/launcher/adapter/compat/d;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/zte/mifavor/launcher/adapter/compat/c;->a:Lcom/zte/mifavor/launcher/adapter/compat/d;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v1
.end method


# virtual methods
.method public abstract a(Landroid/view/View;Z)Landroid/graphics/Bitmap;
.end method

.method public abstract b(Landroid/content/Context;Ljava/util/List;)Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Landroid/content/ComponentName;"
        }
    .end annotation
.end method

.method public abstract d(Landroid/os/UserHandle;I)I
.end method

.method public abstract e(I)Landroid/os/UserHandle;
.end method

.method public abstract f(Landroid/os/UserHandle;)I
.end method

.method public abstract g(Landroid/content/Context;)Z
.end method

.method public abstract h(Landroid/content/Context;)Z
.end method

.method public abstract i(I)Landroid/os/UserHandle;
.end method

.method public abstract j(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;Landroid/os/UserHandle;)V
.end method
