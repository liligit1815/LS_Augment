.class public final synthetic Lcom/android/quickstep/util/q;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ls1/P;

.field public final synthetic b:Lcom/android/launcher3/model/data/l;


# direct methods
.method public synthetic constructor <init>(Ls1/P;Lcom/android/launcher3/model/data/l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/q;->a:Ls1/P;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/q;->b:Lcom/android/launcher3/model/data/l;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/q;->a:Ls1/P;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/q;->b:Lcom/android/launcher3/model/data/l;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/util/AppPairsController;->a(Ls1/P;Lcom/android/launcher3/model/data/l;Lcom/android/launcher3/model/data/I;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
