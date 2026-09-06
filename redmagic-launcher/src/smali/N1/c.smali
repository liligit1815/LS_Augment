.class public final synthetic LN1/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ls1/e;


# instance fields
.field public final synthetic a:LN1/d;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(LN1/d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN1/c;->a:LN1/d;

    .line 5
    .line 6
    iput p2, p0, LN1/c;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, LN1/c;->a:LN1/d;

    .line 2
    .line 3
    iget p0, p0, LN1/c;->b:I

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, LN1/d;->t(LN1/d;ILandroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
