.class public final LK/a;
.super Landroid/text/style/ClickableSpan;
.source "AccessibilityClickableSpanCompat.java"


# instance fields
.field private final g:I

.field private final h:LK/d;

.field private final i:I


# direct methods
.method public constructor <init>(ILK/d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LK/a;->g:I

    .line 5
    .line 6
    iput-object p2, p0, LK/a;->h:LK/d;

    .line 7
    .line 8
    iput p3, p0, LK/a;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "ACCESSIBILITY_CLICKABLE_SPAN_ID"

    .line 7
    .line 8
    iget v1, p0, LK/a;->g:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LK/a;->h:LK/d;

    .line 14
    .line 15
    iget p0, p0, LK/a;->i:I

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1}, LK/d;->Z(ILandroid/os/Bundle;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
