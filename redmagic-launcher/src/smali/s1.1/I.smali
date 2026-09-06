.class public final synthetic Ls1/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Ls1/P;

.field public final synthetic b:Lcom/android/launcher3/model/data/B;


# direct methods
.method public synthetic constructor <init>(Ls1/P;Lcom/android/launcher3/model/data/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/I;->a:Ls1/P;

    .line 5
    .line 6
    iput-object p2, p0, Ls1/I;->b:Lcom/android/launcher3/model/data/B;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/I;->a:Ls1/P;

    .line 2
    .line 3
    iget-object p0, p0, Ls1/I;->b:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ls1/P;->a0(Ls1/P;Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
