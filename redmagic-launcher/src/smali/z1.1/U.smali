.class public final synthetic Lz1/U;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/util/B0;

.field public final synthetic b:Lz1/J3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/B0;Lz1/J3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/U;->a:Lcom/android/launcher3/util/B0;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/U;->b:Lz1/J3;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/U;->a:Lcom/android/launcher3/util/B0;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/U;->b:Lz1/J3;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lz1/O$b;->p(Lcom/android/launcher3/util/B0;Lz1/J3;Lcom/android/launcher3/model/data/y;)Landroid/util/Pair;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
