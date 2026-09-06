.class final Landroid/os/BinderUtils$LifecycleBinderWrapper;
.super Landroid/os/Binder;
.source "BinderUtils.kt"

# interfaces
.implements Lcom/android/launcher3/util/o3$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/BinderUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LifecycleBinderWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/os/Binder;",
        ">",
        "Landroid/os/Binder;",
        "Lcom/android/launcher3/util/o3$b;"
    }
.end annotation


# instance fields
.field private realBinder:Landroid/os/Binder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Binder;Lcom/android/launcher3/util/o3;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/util/o3;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "cleanupSet"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/os/Binder;->getInterfaceDescriptor()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-direct {p0, v0}, Landroid/os/Binder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Landroid/os/BinderUtils$LifecycleBinderWrapper;->realBinder:Landroid/os/Binder;

    .line 18
    .line 19
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 20
    .line 21
    new-instance v0, Landroid/os/a;

    .line 22
    .line 23
    invoke-direct {v0, p2, p0}, Landroid/os/a;-><init>(Lcom/android/launcher3/util/o3;Landroid/os/BinderUtils$LifecycleBinderWrapper;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private static final _init_$lambda$0(Lcom/android/launcher3/util/o3;Landroid/os/BinderUtils$LifecycleBinderWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/o3;->e(Lcom/android/launcher3/util/o3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/o3;Landroid/os/BinderUtils$LifecycleBinderWrapper;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/os/BinderUtils$LifecycleBinderWrapper;->_init_$lambda$0(Lcom/android/launcher3/util/o3;Landroid/os/BinderUtils$LifecycleBinderWrapper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onOwnerDestroyed()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Landroid/os/BinderUtils$LifecycleBinderWrapper;->realBinder:Landroid/os/Binder;

    .line 3
    .line 4
    return-void
.end method

.method protected onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 1

    .line 1
    const-string v0, "data"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroid/os/BinderUtils$LifecycleBinderWrapper;->realBinder:Landroid/os/Binder;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/os/Binder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    new-instance p0, Landroid/os/RemoteException;

    .line 16
    .line 17
    const-string p1, "Original binder cleaned up"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Landroid/os/RemoteException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0
.end method

.method public queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;
    .locals 1

    .line 1
    const-string v0, "descriptor"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroid/os/BinderUtils$LifecycleBinderWrapper;->realBinder:Landroid/os/Binder;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/os/Binder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method
