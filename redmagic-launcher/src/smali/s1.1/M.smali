.class public final synthetic Ls1/M;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Ls1/P;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Lcom/android/launcher3/model/data/z;


# direct methods
.method public synthetic constructor <init>(Ls1/P;Landroid/content/Intent;Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/M;->a:Ls1/P;

    .line 5
    .line 6
    iput-object p2, p0, Ls1/M;->b:Landroid/content/Intent;

    .line 7
    .line 8
    iput-object p3, p0, Ls1/M;->c:Lcom/android/launcher3/model/data/z;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/M;->a:Ls1/P;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/M;->b:Landroid/content/Intent;

    .line 4
    .line 5
    iget-object p0, p0, Ls1/M;->c:Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ls1/P;->X(Ls1/P;Landroid/content/Intent;Lcom/android/launcher3/model/data/z;)Landroid/content/pm/LauncherActivityInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
