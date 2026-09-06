.class public final synthetic Lz1/Q3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lz1/V3;

.field public final synthetic b:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Lz1/V3;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/Q3;->a:Lz1/V3;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/Q3;->b:Ljava/util/HashSet;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/Q3;->a:Lz1/V3;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/Q3;->b:Ljava/util/HashSet;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lz1/V3;->g(Lz1/V3;Ljava/util/HashSet;Lcom/android/launcher3/model/data/I;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
