.class public final synthetic Lz1/D3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lz1/J3;

.field public final synthetic b:Lcom/android/launcher3/model/data/y;


# direct methods
.method public synthetic constructor <init>(Lz1/J3;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/D3;->a:Lz1/J3;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/D3;->b:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/D3;->a:Lz1/J3;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/D3;->b:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lz1/J3;->p(Lz1/J3;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
