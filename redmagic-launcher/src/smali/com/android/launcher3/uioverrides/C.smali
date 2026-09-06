.class public final synthetic Lcom/android/launcher3/uioverrides/C;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/uioverrides/H$e;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/appwidget/AppWidgetHostView;

    .line 2
    .line 3
    check-cast p2, Landroid/widget/RemoteViews;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
