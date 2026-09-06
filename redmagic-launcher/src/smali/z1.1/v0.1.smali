.class public final synthetic Lz1/v0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/stream/Stream$Builder;


# direct methods
.method public synthetic constructor <init>(Ljava/util/stream/Stream$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/v0;->a:Ljava/util/stream/Stream$Builder;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/v0;->a:Ljava/util/stream/Stream$Builder;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/stream/Stream$Builder;->accept(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
