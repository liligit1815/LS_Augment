.class public final synthetic LD1/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:LD1/t;


# direct methods
.method public synthetic constructor <init>(LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD1/m;->a:LD1/t;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, LD1/m;->a:LD1/t;

    .line 2
    .line 3
    check-cast p1, Landroid/content/Intent;

    .line 4
    .line 5
    invoke-static {p0, p1}, LD1/t;->e(LD1/t;Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
