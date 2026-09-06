.class public final Landroid/os/BinderUtils;
.super Ljava/lang/Object;
.source "BinderUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/os/BinderUtils$LifecycleBinderWrapper;
    }
.end annotation


# static fields
.field public static final INSTANCE:Landroid/os/BinderUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/BinderUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/BinderUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroid/os/BinderUtils;->INSTANCE:Landroid/os/BinderUtils;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final wrapLifecycle(Landroid/os/Binder;Lcom/android/launcher3/util/o3;)Landroid/os/Binder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/os/Binder;",
            ">(TT;",
            "Lcom/android/launcher3/util/o3;",
            ")",
            "Landroid/os/Binder;"
        }
    .end annotation

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "cleanupSet"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/os/BinderUtils$LifecycleBinderWrapper;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Landroid/os/BinderUtils$LifecycleBinderWrapper;-><init>(Landroid/os/Binder;Lcom/android/launcher3/util/o3;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
