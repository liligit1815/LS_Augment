.class public final synthetic Ls1/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntFunction;


# instance fields
.field public final synthetic a:Landroid/content/res/Resources;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/res/Resources;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/i;->a:Landroid/content/res/Resources;

    .line 5
    .line 6
    iput p2, p0, Ls1/i;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/i;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    iget p0, p0, Ls1/i;->b:I

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ls1/j;->c(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
