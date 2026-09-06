.class public final LW1/z$a;
.super Landroid/view/ViewOutlineProvider;
.source "BubbleBarFlyoutView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW1/z;-><init>(Landroid/content/Context;LW1/n;LW1/B;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic a:LW1/z;


# direct methods
.method constructor <init>(LW1/z;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW1/z$a;->a:LW1/z;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 1

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "outline"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, LW1/z$a;->a:LW1/z;

    .line 12
    .line 13
    invoke-static {p0, p2}, LW1/z;->s(LW1/z;Landroid/graphics/Outline;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
