.class public final synthetic Lz1/A0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lz1/F0;

.field public final synthetic b:Ls1/P;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lz1/F0;Ls1/P;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/A0;->a:Lz1/F0;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/A0;->b:Ls1/P;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/A0;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/A0;->a:Lz1/F0;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/A0;->b:Ls1/P;

    .line 4
    .line 5
    iget-object p0, p0, Lz1/A0;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lz1/F0;->f(Lz1/F0;Ls1/P;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
