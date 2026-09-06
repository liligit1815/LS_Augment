.class public final synthetic Lcom/android/launcher3/widget/R0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/widget/WidgetCell;

.field public final synthetic h:Lcom/android/launcher3/widget/x0;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/WidgetCell;Lcom/android/launcher3/widget/x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/R0;->g:Lcom/android/launcher3/widget/WidgetCell;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/R0;->h:Lcom/android/launcher3/widget/x0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/R0;->g:Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/R0;->h:Lcom/android/launcher3/widget/x0;

    .line 4
    .line 5
    move-object v2, p1

    .line 6
    move v3, p2

    .line 7
    move v4, p3

    .line 8
    move v5, p4

    .line 9
    move/from16 v6, p5

    .line 10
    .line 11
    move/from16 v7, p6

    .line 12
    .line 13
    move/from16 v8, p7

    .line 14
    .line 15
    move/from16 v9, p8

    .line 16
    .line 17
    move/from16 v10, p9

    .line 18
    .line 19
    invoke-static/range {v0 .. v10}, Lcom/android/launcher3/widget/WidgetCell;->c(Lcom/android/launcher3/widget/WidgetCell;Lcom/android/launcher3/widget/x0;Landroid/view/View;IIIIIIII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
