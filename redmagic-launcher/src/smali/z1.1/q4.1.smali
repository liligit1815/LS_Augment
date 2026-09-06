.class public final synthetic Lz1/q4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ObjIntConsumer;


# instance fields
.field public final synthetic a:Lz1/w4;


# direct methods
.method public synthetic constructor <init>(Lz1/w4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/q4;->a:Lz1/w4;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/q4;->a:Lz1/w4;

    .line 2
    .line 3
    check-cast p1, Landroid/app/prediction/AppTargetEvent;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lz1/w4;->z(Landroid/app/prediction/AppTargetEvent;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
