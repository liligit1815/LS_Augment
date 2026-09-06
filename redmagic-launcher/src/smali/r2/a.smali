.class public final synthetic Lr2/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Landroid/appwidget/AppWidgetProviderInfo;

.field public final synthetic i:I

.field public final synthetic j:I

.field public final synthetic k:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lr2/a;->g:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lr2/a;->h:Landroid/appwidget/AppWidgetProviderInfo;

    .line 7
    .line 8
    iput p3, p0, Lr2/a;->i:I

    .line 9
    .line 10
    iput p4, p0, Lr2/a;->j:I

    .line 11
    .line 12
    iput p5, p0, Lr2/a;->k:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lr2/a;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lr2/a;->h:Landroid/appwidget/AppWidgetProviderInfo;

    .line 4
    .line 5
    iget v2, p0, Lr2/a;->i:I

    .line 6
    .line 7
    iget v3, p0, Lr2/a;->j:I

    .line 8
    .line 9
    iget p0, p0, Lr2/a;->k:I

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lr2/b;->a(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;III)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
