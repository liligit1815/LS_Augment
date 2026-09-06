.class public final synthetic Lcom/android/launcher3/Y5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/WidgetPickerActivity;

.field public final synthetic h:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/WidgetPickerActivity;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/Y5;->g:Lcom/android/launcher3/WidgetPickerActivity;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/Y5;->h:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Y5;->g:Lcom/android/launcher3/WidgetPickerActivity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/Y5;->h:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/WidgetPickerActivity;->c0(Lcom/android/launcher3/WidgetPickerActivity;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
