.class public final synthetic Lz1/P;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/function/Predicate;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/util/ArrayList;

.field public final synthetic e:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/P;->a:Ljava/util/function/Predicate;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/P;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/P;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/P;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/P;->e:Ljava/util/ArrayList;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lz1/P;->a:Ljava/util/function/Predicate;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/P;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v2, p0, Lz1/P;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object v3, p0, Lz1/P;->d:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object v4, p0, Lz1/P;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    invoke-static/range {v0 .. v5}, Lz1/O$b;->n(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
