.class public final synthetic Lz1/p0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lz1/y0;


# direct methods
.method public synthetic constructor <init>(Lz1/y0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/p0;->a:Lz1/y0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/p0;->a:Lz1/y0;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lz1/y0;->g(Lz1/y0;Lcom/android/launcher3/model/data/y;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
