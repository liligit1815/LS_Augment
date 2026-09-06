.class public final synthetic Lz1/W3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/W3;->a:Ljava/util/HashSet;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/W3;->a:Ljava/util/HashSet;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lz1/h4;->g(Ljava/util/HashSet;Lcom/android/launcher3/model/data/d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
