.class public final synthetic Lz1/V1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Ls1/P;


# direct methods
.method public synthetic constructor <init>(Ls1/P;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/V1;->a:Ls1/P;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/V1;->a:Ls1/P;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/util/L1;

    .line 4
    .line 5
    check-cast p2, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ls1/P;->Z0(Lcom/android/launcher3/util/L1;Landroid/content/pm/PackageInstaller$SessionInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
