.class public final synthetic Lz1/Z1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/function/Predicate;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/Z1;->a:Ljava/util/function/Predicate;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/Z1;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/Z1;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/Z1;->a:Ljava/util/function/Predicate;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/Z1;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object p0, p0, Lz1/Z1;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lz1/c2;->f(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
