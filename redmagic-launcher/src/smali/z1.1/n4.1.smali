.class public final synthetic Lz1/n4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Landroid/content/ComponentName;

.field public final synthetic c:Landroid/os/UserHandle;

.field public final synthetic d:Ls1/P;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;Ls1/P;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/n4;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/n4;->b:Landroid/content/ComponentName;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/n4;->c:Landroid/os/UserHandle;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/n4;->d:Ls1/P;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/n4;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/n4;->b:Landroid/content/ComponentName;

    .line 4
    .line 5
    iget-object v2, p0, Lz1/n4;->c:Landroid/os/UserHandle;

    .line 6
    .line 7
    iget-object p0, p0, Lz1/n4;->d:Ls1/P;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lz1/p4;->f(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;Ls1/P;)Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
